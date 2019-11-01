;; 安装use-package插件
(my/install-package 'use-package)

;; 使用elpy作为python补全
(use-package elpy
  :ensure t
  :pin melpa
  :init
  (elpy-enable))

;; 提供init-elpy feature
(provide 'init-elpy)
