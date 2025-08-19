// GERENCIAMENTO DE DEPENDÊNCIAS NO FLUTTER

// ADICIONANDO DEPENDÊNCIAS AO PROJETO FLUTTER

    // 1.	Arquivo pubspec.yaml
    //    Este arquivo contém a configuração do projeto, incluindo dependências.
    //    Estrutura básica

    // 2.	Adicionar uma Nova Dependência
    //  	Abra o arquivo pubspec.yaml.
    //  	Adicione a dependência desejada na seção dependencies:
    // dependencies:
    //  flutter:
    //    sdk: flutter
    //  provider: ^6.0.0  # Nova dependência adicionada

    // 3.	Instalar Dependências
    //  	Após adicionar a dependência, execute o comando:
    //      flutter pub get



// ATUALIZANDO DEPENDÊNCIAS

    // 1.	Atualizar para a Última Versão Compatível
    //    	Execute:
    //          flutter pub upgrade

    // 2.	Especificar uma Versão Específica
    //  	No arquivo pubspec.yaml, especifique a versão desejada:
    // dependencies:
    //    provider: 6.0.0
    //  Execute:
    //    flutter pub get



// REMOVENDO DEPENDÊNCIAS

    // 1.	Remover uma Dependência
    //      No arquivo pubspec.yaml, remova a linha correspondente à dependência.
    //    	Execute:
    //        flutter pub get



// VERIFICAÇÃO DE COMPATIBILIDADE

    //  1.	Checar Problemas de Compatibilidade
    //  Execute:
    //      flutter pub outdated
    //    	Este comando mostra uma lista de dependências que podem ser atualizadas e possíveis problemas de compatibilidade.

    //  2.	Resolução Manual de Conflitos
    //  Edite o arquivo pubspec.yaml para ajustar versões de dependências que causam conflitos.
    //	Execute:
    //      flutter pub get
