{:user
 {:dependencies [[pjstadig/humane-test-output "0.7.1"]]
  :injections [(require 'pjstadig.humane-test-output)
               (pjstadig.humane-test-output/activate!)]
  :plugins [[lein-difftest "2.0.0"]
            [lein-cljfmt "0.3.0"]]
  :signing {:gpg-key "CE27F99B"}}}
