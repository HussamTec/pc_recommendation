import 'package:cloud_firestore/cloud_firestore.dart';

class Recommendation{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Function to retrieve the names of favorite collections in Firestore.

  Future<List<String>> getFavoritesCollectionNames() async {
    /// Get a Stream of all collections within the "user_favorites" collection group.

    // We've replaced `.get()` with a Stream 'snapshots' because it might be more efficient
    // for large datasets, retrieving documents in chunks.
    // Get a Stream of all collections within the "user_favorites" collection group.
    final collections = _firestore.collectionGroup('user_favorites').snapshots();

    /// Create an empty list to store the collection names.
    final collectionNames = <String>[];

    /// Wait for the Stream to potentially emit multiple snapshots containing documents.
    final snapshot = await collections.first; // Get the first snapshot

    /// Filter documents where the collection ID starts with "user_favorites".
    /// This assumes a specific naming convention for favorite collections.
    collectionNames.addAll(snapshot.docs
        .where((doc) => doc.reference.id.startsWith('user_favorites'))
        .map((doc) => doc.reference.id)
        .toList());

    /// Return the list of favorite collection names.
    return collectionNames;
  }  //gbna kol asma2 al collections bta3t al favorites lkol al users

  /// Function to retrieve and process data from all favorite collections in Firestore using pagination.

  Future<List<Map<String, dynamic>>> saveAllFavoritesDataPaginated() async {
    /// Get a list of names for the favorite collections.
    final collectionNames = await getFavoritesCollectionNames();

    /// Create an empty list to store all retrieved documents.
    final allDocuments = <QueryDocumentSnapshot<Map<String, dynamic>>>[];

    /// Iterate through each favorite collection name.
    for (final name in collectionNames) {
      /// Get a reference to the current favorite collection.
      final collectionRef = _firestore.collection(name);

      /// Variable to store the last retrieved document for pagination (initially null).
      QueryDocumentSnapshot<Map<String, dynamic>>? lastDocument;

      /// Loop to retrieve documents in chunks of 100 using pagination.
      do {
        /// Create a query to retrieve documents limited to 100.
        final query = collectionRef.limit(100);

        /// If there's a last document from the previous iteration, use it for startAfter.
        if (lastDocument != null) {
          query.startAfterDocument(lastDocument);
        }

        /// Get the snapshot containing the retrieved documents for the current chunk.
        final snapshot = await query.get();

        /// Extract the documents from the snapshot and add them to the allDocuments list.
        final documents = snapshot.docs;
        allDocuments.addAll(documents);

        /// Update the lastDocument for the next iteration if more documents exist.
        lastDocument = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;

        /// Continue looping as long as there are more documents (indicated by lastDocument).
      } while (lastDocument != null);
    }

    /// Assuming getTopThreeOccurredIds is implemented elsewhere, use it to find the top 3 IDs from all documents.
    final mostThreeOccurredId = await getTopThreeOccurredIds(allDocuments);

    /// Print the IDs of the most three occurred items across all favorites collections.
    print('Most Three Occurred IDs across all favorites: $mostThreeOccurredId');

    /// Return the list containing information about the top three most occurred items.
    return mostThreeOccurredId;
  }

  /// Function to find the top 3 most occurred IDs from a list of documents (identified by 'id' field).

  Future<List<Map<String, dynamic>>> getTopThreeOccurredIds(List<QueryDocumentSnapshot<Map<String, dynamic>>> documents) async {
    /// Check if any documents were provided.
    if (documents.isEmpty) {
      return []; // Return an empty list if no documents are provided.
    }

    /// Get the collection path from the first document's reference.
    /// This is used to create a reference to the same collection where the counts might be stored.
    final collectionPath = documents[0].reference.path;
    final collectionRef = _firestore.collection(collectionPath);

    // We've commented out idList extraction as it's not used in the current logic.

    try {
      /// Create a reference to the subcollection named "id_counts" within the collection.
      final countRef = collectionRef.doc('id_counts'); // Use doc for subcollection document

      /// This section assumes a subcollection named "id_counts" exists
      /// and it stores a document named 'id_counts' that contains fields representing counts for each ID.

      /// Create a WriteBatch to efficiently update the count for each retrieved document in the "id_counts" subcollection.
      final updateBatch = FirebaseFirestore.instance.batch();

      /// Loop through each document in the provided list.
      for (final doc in documents) {
        /// Extract the document ID.
        final id = doc.id;

        /// Create a field name based on the ID (assuming 'count_' prefix).
        final fieldToUpdate = 'count_$id';

        /// Update the specific field in the "id_counts" document to increment the count for the current ID.
        updateBatch.update(countRef, {fieldToUpdate: FieldValue.increment(1)});
      }

      /// Commit the batch to write all count updates to Firestore in a single operation.
      await updateBatch.commit();

      /// Read the "id_counts" document to get the count information for each ID.
      final countSnapshot = await countRef.get();
      final countData = countSnapshot.data as Map<String, dynamic>;

      /// Create a list to store information about the top 3 most occurred IDs.
      final topThree = List<Map<String, dynamic>>.generate(3, (_) => {'id': '', 'count': 0});

      /// Iterate through each key-value pair in the count data.
      for (var key in countData.keys) {
        /// Check if the key starts with "count_" (assuming this prefix identifies count fields).
        if (key.startsWith('count_')) {
          /// Extract the count value from the data map.
          final count = countData[key];

          /// Extract the ID from the field name by removing the prefix.
          final id = key.substring(6);

          /// Loop through the topThree list to find the appropriate position for the current ID based on its count.
          for (var i = 0; i < 3; i++) {
            /// If the current count is higher than any in the topThree list so far:
            if (count > topThree[i]['count']) {
              /// Shift elements down in the topThree list to make space for the new entry.
              for (var j = 2; j > i; j--) {
                topThree[j] = topThree[j - 1];
              }

              /// Insert the current ID and its count information into the topThree list at the appropriate position.
              topThree[i] = {'id': id, 'count': count};

              /// Break out of the loop as we've found the position for the current ID.
              break;
            }
          }
        }
      }

      /// Return the list containing information about the top 3 most occurred IDs.
      return topThree;
    } catch (error) {
      /// Print an error message if there's an issue during the process.
      print('Error getting top three occurred IDs: $error');
      /// Return an empty list to indicate an error.
      return []; // Handle potential errors
    }
  }



  /// Function to save a list of recommendations to the "top_three_recommendations" collection in Firestore.

  Future<void> saveTopThreeRecommendations() async {
    final List<Map<String, dynamic>> recList = await saveAllFavoritesDataPaginated();
    /// Get a reference to the "top_three_recommendations" collection.
    final collectionRef = _firestore.collection('top_three_recommendations');

    /// Create a WriteBatch to perform multiple writes efficiently.
    final batch = FirebaseFirestore.instance.batch();

    /// Write each recommendation document to the collection.
    for (int i = 0; i < recList.length; i++) {
      /// Extract the current recommendation map from the list.
      final recommendation = recList[i];

      /// Create a document reference with an optional auto-ID (here using a string index).
      final docRef = collectionRef.doc('$i'); // Can be replaced with custom ID generation logic

      /// Add a "set" operation to the batch to write the recommendation data to the document.
      batch.set(docRef, recommendation);
    }

    /// Commit the batch to write all recommendations to Firestore in a single operation.
    await batch.commit();

    /// Print a success message upon successful save.
    print('Top three recommendations saved successfully!');
  }



  /// Function to retrieve the top three recommendations from the "top_three_recommendations" collection in Firestore.

  Future<List<Map<String, dynamic>>> getTopThreeRecommendations() async {
    /// Get a reference to the "top_three_recommendations" collection.
    final collectionRef = _firestore.collection('top_three_recommendations');

    /// Retrieve all documents from the collection.1
    final querySnapshot = await collectionRef.get();

    /// Extract the data from each document and convert them to a list of recommendation maps.
    final recommendations = querySnapshot.docs
        .map((doc) => doc.data())
        .toList();

    /// Return the list of recommendations retrieved from Firestore.
    return recommendations;
  }

}


