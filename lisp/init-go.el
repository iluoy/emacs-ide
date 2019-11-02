;; 定义支持golang需要安装的插件列表
(setq my/go-packages '(
		       go-mode
		       go-autocomplete
		       go-eldoc))

;; 安装支持golang需要的插件
(dolist (golang-p my/go-packages)
  (my/install-package golang-p))

;; 配置支持golang
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; 提供init-go feature
(provide 'init-go)
