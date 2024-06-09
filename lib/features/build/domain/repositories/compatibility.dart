class PcPartCompatibility {
  static final _compatibleSockets = {
    // Example socket compatibility data
    'LGA1700': ['Alder Lake', 'Raptor Lake'],
    'AM4': ['Ryzen 3000', 'Ryzen 5000'],
  };

  static final _compatibleRam = {
    // Example DDR compatibility data
    'DDR4': ['DDR4-3200', 'DDR4-3600'],
    'DDR5': ['DDR5-4800', 'DDR5-5600'],
  };

  // Add methods for checking compatibility based on your data structures

  bool isProcessorSocketCompatible(String processorSocket, String motherboardSocket) {
    return _compatibleSockets[motherboardSocket]?.contains(processorSocket) ?? false;
  }

  bool isRamMotherboardCompatible(String ramType, String motherboardRamSupport) {
    return _compatibleRam[motherboardRamSupport]?.contains(ramType) ?? false;
  }

  // Implement similar methods for PSU wattage, connectors, and GPU size

  bool isPcBuildCompatible(PcPart processor, PcPart motherboard, PcPart ram, PcPart psu, PcPart gpu, PcCase pcCase) {
    // Check each compatibility aspect using the implemented methods
    return isProcessorSocketCompatible(processor.socket, motherboard.socket) &&
        isRamMotherboardCompatible(ram.type, motherboard.ramSupport) ;
    // ... add checks for PSU wattage, connectors, GPU size and case compatibility
  }
}

class PcPart {
  final String name;
  final String type;
  final String socket;
  final String ramSupport;
  // Add relevant properties for each PC part (e.g., socket for processor, type for ram, wattage for psu)

  const PcPart(this.name,this.type,this.ramSupport,this.socket);
}

class PcCase {
  final int maxSize; // Maximum size for GPU (e.g., in millimeters)
  const PcCase(this.maxSize);
}

