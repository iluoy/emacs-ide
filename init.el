;; 添加lisp目录到load-path变量
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 加载与插件无关的Emacs自带的配置init-base feature
(require 'init-base)

;; 加载与插件无关的自定义函数init-custom-fun feature
(require 'init-custom-fun)

;; 加载与插件无关的快捷键绑定init-keys feature
(require 'init-keys)

;; 加载init-theme feature
(require 'init-theme)

;; 加载init-company feature
(require 'init-company)

;; 加载init-ivy feature
(require 'init-ivy)

;; 加载init-exec feature
(require 'init-exec)

;; 加载init-elpy feature
(require 'init-elpy)

;; 加载init-org feature
(require 'init-org)

