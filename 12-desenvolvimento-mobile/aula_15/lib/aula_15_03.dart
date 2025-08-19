// ESTRATÉGIAS DE RESOLUÇÃO DE CONFLITOS

    //  1.	Atualização de Dependências
	  //  Atualize todas as dependências para suas últimas versões compatíveis:
    //    flutter pub upgrade

    //  2.	Especificação de Versões Compatíveis
    //  Ajuste as versões de dependências no pubspec.yaml para garantir compatibilidade:
    //    dependencies:
    //      provider: ^6.0.0
    //      http: ^0.13.3

    //  3.	Uso de Overrides
    //  Utilize dependency_overrides para forçar uma versão específica de uma dependência:
    //      dependency_overrides:
    //        http: ^0.13.3

    //  4.	Remover Dependências Conflitantes
    //  Se uma dependência não for essencial, considere removê-la para resolver o conflito.


    //  FERRAMENTAS DE VERIFICAÇÃO

    //  1.	pub outdated
    //	Execute:
    //      flutter pub outdated
    //    	Esta ferramenta mostra uma lista de dependências que estão desatualizadas e possíveis problemas de compatibilidade.

    //  2.	pub deps
    //  Execute:
    //    flutter pub deps
    //   	Este comando exibe a árvore de dependências do projeto, ajudando a identificar conflitos.
