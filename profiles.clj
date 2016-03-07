{:user
 {:dependencies [
    [pjstadig/humane-test-output "0.7.1"]
    [org.clojure/tools.namespace "0.2.11"]
  ]
  :injections [(require 'pjstadig.humane-test-output)
               (pjstadig.humane-test-output/activate!)]
  :plugins [[lein-difftest "2.0.0"]
            [lein-cljfmt "0.3.0"]]
  :signing {:gpg-key "CE27F99B"}}
 :repl {:plugins [[cider/cider-nrepl "0.11.0"]]}
}
