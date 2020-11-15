;;(add-hook 'enh-ruby-mode-hook #'flycheck-mode)
;;(add-hook 'enh-ruby-mode-hook #'auto-complete-mode)
(add-hook 'enh-ruby-mode-hook #'color-identifiers-mode)
(add-hook 'enh-ruby-mode-hook #'rainbow-delimiters-mode)
(add-hook 'enh-ruby-mode-hook #'robe-mode)
(eval-after-load 'company-mode
  '(push 'company-robe company-backends))


;; highlight intendation
(add-hook 'enh-ruby-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))

(add-hook 'coffee-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(require 'color-identifiers-mode)
(add-to-list
 'color-identifiers:modes-alist
 `(enh-ruby-mode . ("[^.][[:space:]]*" "\\_<\\([a-zA-Z_$]\\(?:\\s_\\|\\sw\\)*\\)" (nil))))


;; find current word under cursor on buffer

(defun x-occur ()
  (interactive)
  (occur (current-word))
)

(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-q") 'x-occur)))
