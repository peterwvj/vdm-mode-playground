
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Use 'use-package' to manage packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package use-package
  :config
  (setq use-package-always-ensure t)
  (setq use-package-always-demand t)
  (setq use-package-always-pin "melpa"))

(use-package vdm-comint)

(use-package flycheck-vdm)
(use-package vdm-snippets)
(use-package vdm-mode
  :config
  (setq flycheck-vdm-tool-jar-path (expand-file-name "~/vdmj.jar"))
  (vdm-mode-setup))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (vdm-snippets flycheck-vdm vdm-comint use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
