;; 定义想要安装的主题列表
(setq my/theme-list '(
		      spacemacs-theme
		      monokai-theme
		      molokai-theme))

;; 安装主题列表中的主题
(dolist (theme my/theme-list)
  (my/install-package theme))

;; 加载spacemacs-light主题
(load-theme 'spacemacs-light t)

;; 提供init-theme主题
(provide 'init-theme)
