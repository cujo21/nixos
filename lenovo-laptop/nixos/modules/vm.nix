{config, pkgs, ... }:

{ 
  
  boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ]; 
  boot.kernelModules = [ "kvm-amd" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" "nbd" ];
  boot.extraModprobeConfig = ''
  options vfio-pci ids=10de:2560,10de:228e
  options kvm ignore_msrs=1
  '';
  boot.postBootCommands = ''
    # Enable VFIO on secondary GPU
    for DEV in "0000:01:00.0" "0000:01:00.1"; do
      echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    done
    modprobe -i vfio-pci
    modprobe nbd max_part=16
    # Setup Looking Glass shared memory object
    touch /dev/shm/looking-glass
    chown cujo:kvm /dev/shm/looking-glass
    chmod 660 /dev/shm/looking-glass
  '';



  users.users.cujo.extraGroups = [ "libvirtd" ];
  
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice 
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
    virtiofsd
  ];
  
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      
        verbatimConfig = ''
          namespaces = []
          nographics_allow_host_audio = 1
          user = "cujo"
          group = "kvm"
        '';
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}

