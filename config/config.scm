(use-modules (gnu)
             (gnu system)
             ;;(gnu system initrd)
	         (nongnu packages linux)
             (nongnu packages nvidia) ;; nvidia support
             (nongnu services nvidia)
             (gnu services virtualization))

(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (kernel linux)
  (kernel-arguments (append '("modprobe.blacklist=nouveau") ; Blacklist opensource driver
                          %default-kernel-arguments))


  ;;(firmware (append (list nvidia-firmware)
  ;;                  %base-firmware))
  ;;(firmware (list linux-firmware))
  (firmware (list linux-firmware
                   nvidia-firmware ;; comment out if no nvidia support is needed
                   ))

  ;;(initrd microcode-initrd)
;;  (initrd-modules (append (list "nvidia"
;;                               "nvidia_modeset"
;;                               "nvidia_uvm"
;;                               "nvidia_drm")
;;                         %base-initrd-modules))

  (locale "en_US.utf8")
  (timezone "America/Los_Angeles")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "camellia")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "neo")
                  (comment "Neo")
                  (group "users")
                  (home-directory "/home/neo")
                  (supplementary-groups '("wheel" "netdev" "audio" "video" "libvirt")))
                %base-user-accounts))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service xfce-desktop-service-type)
                 (service openssh-service-type)
                 (service tor-service-type)

                 (service libvirt-service-type
                          (libvirt-configuration
                          (unix-sock-group "libvirt")
                          (tls-port "16555")))
                 (service nvidia-driver-service-type)
                 (set-xorg-configuration
                  (xorg-configuration
                   (keyboard-layout keyboard-layout)
                   (modules (append (list nvidia-driver)
                                    %default-xorg-modules))
                   (drivers (list nvidia-driver)))))

           %desktop-services))
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "44cd7b27-dbb2-4766-b1dc-443f457765ed")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "4836-D036"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "b29368cb-b613-4559-b720-8eac32ce1aa7"
                                  'ext4))
                         (type "ext4"))
                       (file-system
                         (mount-point "/home")
                         (device (uuid
                                  "9e6484df-93c4-4a51-874b-708a0b47f904"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
