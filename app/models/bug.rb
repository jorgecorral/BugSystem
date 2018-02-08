class Bug < ApplicationRecord
	enum solucionado: [:pendente, :resolvido]
  belongs_to :projeto
  mount_uploader :imagem, ImagemUploader
  after_update do
  	       if self.solucionado == "resolvido"
       notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
  defaults channel: "#general",
         username: "notifier"
        end
        notifier.ping("O bug " + self.descricao + " foi solucionado - Projeto " + self.projeto.nome  + "\n A solução foi: "+ self.solucao)
      end
  end
    after_create do
       notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
  defaults channel: "#general",
         username: "notifier"
        end
        notifier.ping("Foi adicionado um bug no projeto " + self.projeto.nome + " cujo a descrição é " + self.descricao)
  end

end
