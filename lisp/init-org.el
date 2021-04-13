;; 添加org导出md功能
(with-eval-after-load 'org
  (add-to-list 'org-export-backends 'md))

;; 自动换行
(global-visual-line-mode 1)

;; 提供init-org的feature
(provide 'init-org)
