;; 定义左侧目录导航栏需要的插件列表
(setq my/neotree-list '(
			neotree
			all-the-icons))

;; 安装my/neotree-list中所有的插件
(dolist (neo my/neotree-list)
  (my/install-package neo))

;; 绑定打开左侧目录栏快捷键为F8
(global-set-key [f8] 'neotree-toggle)

;; 设置主题
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; 提供init-neotree feature
(provide 'init-neotree)
