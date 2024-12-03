(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:use-module (gnu services dotfiles)


(home-environment
  (services (list 
  	          (service home-dotfiles-service-type
			   (home-dotfiles-configuration
			    (directories '("../files"))))))))
