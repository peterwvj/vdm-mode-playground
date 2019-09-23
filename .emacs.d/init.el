
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

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file nil t nil nil)

(use-package vdm-comint)

(use-package flycheck-vdm)
(use-package vdm-snippets)
(use-package vdm-mode
  :config
  (setq flycheck-vdm-tool-jar-path (expand-file-name "~/vdmj.jar"))
  (vdm-mode-setup))

(use-package company
  :config
  ;; Tell dabbrev not to downcase candidates. See
  ;; https://emacs.stackexchange.com/questions/10837/how-to-make-company-mode-be-case-sensitive-on-plain-text
  (setq company-dabbrev-downcase nil)
  
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "M-C-/") 'company-complete)

  (setq company-dabbrev-other-buffers t))
