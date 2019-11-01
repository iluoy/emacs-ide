;; 安装exec-path-from-shell插件
(my/install-package 'exec-path-from-shell)

;; 初始化exec
(exec-path-from-shell-initialize)

;; 提供init-exec feature
(provide 'init-exec)
