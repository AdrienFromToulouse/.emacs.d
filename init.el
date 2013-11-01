(when (string-equal system-type "windows-nt")
(find-file "c:/Users/Adrien/Documents")
(find-file "C:/Users/Adrien/workspace")
(find-file "C:/Users/Adrien/workspace/phonegap-phonegap-plugins-AdPlugin-20100712-1259-g31631e4/phonegap-phonegap-plugins-31631e4/Android/AugmentedReality-Wikitude/SampleProjects/Basic/HelloWorld")
(find-file "C:/Users/Adrien/workspace/phonegap-phonegap-plugins-AdPlugin-20100712-1259-g31631e4/phonegap-phonegap-plugins-31631e4/Android/AugmentedReality-Wikitude/SampleProjects/Extended")
(find-file "X:/asiance/drafts/web/share/caseStudiesLib/react-page-yo-gen-project")
(find-file "X:/")
(find-file "W:/")
(find-file "Y:/")
(find-file "Z:/")
)

(set-face-attribute 'default nil :height 100)

(setq indent-tabs-mode nil)

;; ===== Load theme before solarized =====
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized-master")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(load "color-theme")
(require 'color-theme-solarized)
(setq color-theme-is-global t)
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(setq solarized-termcolors 256)
(color-theme-solarized-dark)

(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 2)
            (setq indent-tabs-mode t)))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq-default indent-tabs-mode nil)
(add-hook 'write-file-hooks 
          (lambda () (if (not indent-tabs-mode)
                         (untabify (point-min) (point-max)))))
;; (add-hook 'before-save-hook 'untabify) ; update when saving


;; ===== Set standard indent to 2 rather that 4 ====
(setq standard-indent 2)
;; ===== Prevent Emacs from making backup files ====
(setq backup-inhibited t)
(setq make-backup-files nil) 
;; ===== Enable Line and Column Numbering ====
(line-number-mode 1)
(column-number-mode 1)
;; ===== Coding system ====
(prefer-coding-system 'utf-8)
;; ===== Network / remote ====
(setq tramp-default-method "ssh")
;; ===== Automatically load abbreviations table =====
(show-paren-mode 1)

;; Tell emacs where is your personal elisp lib dir
;; this is the dir you place all your extra packages
(add-to-list 'load-path "~/.emacs.d/")

(load "~/.emacs.d/nxhtml/autostart")
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)

(add-to-list 'load-path
               "~/.emacs.d/yasnippet-master")
(require 'yasnippet)
(yas-global-mode 1)

(require 'coffee-mode)
(setq coffee-tab-width 2)

;; ===== Load packages ====
;; (load "js2")
(load "sql")
(load "sws")
(load "coffee-mode")
(load "jade")
(load "smarty-mode")
(load "scss-mode")
(setq auto-mode-alist (cons '("\\.tpl$" . smarty-mode) auto-mode-alist))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(setq jade-tab-width 2)


;; (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
;; (add-hook 'js2-mode-hook 'my-disable-indent-tabs-mode)
;; (defun my-disable-indent-tabs-mode ()
;;   (set-variable 'indent-tabs-mode nil))

;; (defvar preferred-javascript-indent-level 2)
;; (setq js2-use-font-lock-faces t
;;       js2-mode-must-byte-compile nil
;;       js2-basic-offset preferred-javascript-indent-level
;;       js2-indent-on-enter-key t
;;       js2-auto-indent-p t
;;       js2-bounce-indent-p nil)


;; desable mumamo color because of solarized 
(setq mumamo-background-colors nil)

(menu-bar-mode  t)                       ;; show the menu...
(mouse-avoidance-mode 'jump)             ;; mouse ptr when cursor is too close
(tool-bar-mode -1)                       ;; turn-off toolbar 
(setq cua-enable-cua-keys nil)           ;; only for rectangles
(cua-mode t)
(setq ;; scrolling
  scroll-margin 0                        ;; do smooth scrolling, ...
  scroll-conservatively 100000           ;; ... the defaults ...
  scroll-up-aggressively 0               ;; ... are very ...
  scroll-down-aggressively 0             ;; ... annoying
  scroll-preserve-screen-position t)     ;; preserve screen pos with C-v/M-v 

(setq fringe-mode '(1 . 0))              ;; emacs 22+
(delete-selection-mode 1)                ;; delete the sel with a keyp

(setq x-select-enable-clipboard t        ;; copy-paste should work ...
  interprogram-paste-function            ;; ...with...
  'x-cut-buffer-or-selection-value)      ;; ...other X clients

(setq search-highlight t                 ;; highlight when searching... 
  query-replace-highlight t)             ;; ...and replacing
(fset 'yes-or-no-p 'y-or-n-p)            ;; enable y/n answers to yes/no 

(setq completion-ignore-case t           ;; ignore case when completing...
  read-file-name-completion-ignore-case t) ;; ...filenames too

;; ===== Windows only stuff =====
(when (string-equal system-type "windows-nt")
(progn
(setq cygwin-bin "C:\\cygwin\\bin")
(setenv "PATH"
(concat cygwin-bin ";"))
(setq exec-path
'(cygwin-bin)))) 
(defalias 'qrr 'query-replace-regexp)
(defalias 'cc 'universal-coding-system-argument)
(setq buffer-file-coding-system 'utf-8-unix)
 (setq default-file-name-coding-system 'utf-8-unix)
 (setq default-keyboard-coding-system 'utf-8-unix)
 (setq default-process-coding-system '(utf-8-unix . utf-8-unix))
 (setq default-sendmail-coding-system 'utf-8-unix)
 (setq default-terminal-coding-system 'utf-8-unix)
(custom-set-variables
 '(ac-auto-show-menu t)
 '(mumamo-submode-indent-offset 2))
(custom-set-faces
 )
(put 'narrow-to-region 'disabled nil)

(setq inhibit-splash-screen t
      initial-scratch-message nil)
(setq tab-width 2
      indent-tabs-mode nil)
(setq js-indent-level 2)

;; ===== Set indent for CSS =====
(setq css-indent-offset 2)

;; ===== Use for .json files only =====
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))


;; (defalias 'yes-or-no-p 'y-or-n-p)
;; (defun untabify-buffer ()
;;   (interactive)
;;   (untabify (point-min) (point-max)))
;; (defun indent-buffer ()
;;   (interactive)
;;   (indent-region (point-min) (point-max)))
;; (defun cleanup-buffer ()
;;   "Perform a bunch of operations on the whitespace content of a buffer."
;;   (interactive)
;;   (indent-buffer)
;;   (untabify-buffer)
;;   (delete-trailing-whitespace))
;; (defun cleanup-region (beg end)
;;   "Remove tmux artifacts from region."
;;   (interactive "r")
;;   (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
;;     (replace-regexp re "" nil beg end)))
