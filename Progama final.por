programa
{ // Declaração global das variáveis
    cadeia nome[100], nacionalidade[100]
    inteiro nascimento[100], documento[100], senha[100]
    inteiro usuario_logado = -1
    
    inteiro total_de_usuario = 0
    
    inteiro super_usuario_documento = 1234
    cadeia super_usuario_senha = "admin123"
funcao inicio()
    {
        menu_inicial()
    }

    funcao menu_inicial()
    {
        inteiro opcao = -1

        enquanto (opcao < 0 ou opcao > 2)
        {
            escreva("1 - Login\n")
            escreva("2 - Cadastro\n")
            escreva("0 - Sair\n")
            escreva("Escolha uma das opções: ")
            leia(opcao)

            se (opcao == 1)
            {
                login()
            }
            senao se (opcao == 2)
            {
                cadastro()
            }
            senao se (opcao == 0)
            {
                escreva("Saindo do programa!\n")
            }
            senao
            {
                escreva("Opção inválida!\n")
            }
        }
    }
  
funcao login()

  {
    inteiro doc_inserido
    cadeia senha_inserida
    logico autenticado = falso
    inteiro tentativas = 0

    enquanto (autenticado == falso e tentativas < 3)
    {
        escreva("Digite seu documento: ")
        leia(doc_inserido)
        escreva("Digite sua senha: ")
        leia(senha_inserida)

        // Verifica se é super usuário
        se (doc_inserido == super_usuario_documento e senha_inserida == super_usuario_senha)
        {
            autenticado = verdadeiro
            escreva("\nLogin de SUPER USUÁRIO realizado com sucesso!\n")
            menuSuperUsuario()
            pare
        }
        
        // Verifica usuários normais
        inteiro i = 0
        logico achou = falso

        enquanto (i < total_de_usuario e achou == falso)
        {
            se (documento[i] == doc_inserido e senha[i] == senha_inserida)
            {
                achou = verdadeiro
                autenticado = verdadeiro
                usuario_logado = i
                escreva("\nLogin bem-sucedido! Bem-vindo, ", nome[i], "\n")
                sistema()
                pare
            }
            i = i + 1
        }

        se (achou == falso)
        {
            tentativas = tentativas + 1
            escreva("\nDocumento ou senha incorretos. Tentativa ", tentativas, " de 3.\n\n")
        }
    }

    se (autenticado == falso)
    {
        escreva("Número máximo de tentativas atingido. Acesso negado.\n")
    }
  }
funcao menuSuperUsuario()
 {
    inteiro opcao = -1
    cadeia pausa

    enquanto (opcao < 0)
    {
        escreva("\n=== MENU SUPER USUÁRIO ===\n")
        escreva("1 - Ver todos os usuários cadastrados\n")
        escreva("0 - Logout\n")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha (opcao)
        {
            caso 1:
                verUsuarios()
                pare
            caso 0:
                escreva("Logout efetuado. Voltando ao menu inicial...\n")
                menu_inicial()
                pare
        }
    }
 }
funcao verUsuarios()
 {
    cadeia pausa

    se (total_de_usuario == 0)
    {
        escreva("Nenhum usuário cadastrado.\n")
    }
    senao
    {
        escreva("\n===== USUÁRIOS CADASTRADOS =====\n")
        para (inteiro i = 0; i < total_de_usuario; i = i + 1)
        {
            escreva("Nome: ", nome[i], "\n")
            escreva("Nacionalidade: ", nacionalidade[i], "\n")
            escreva("Data de nascimento: ", nascimento[i], "\n")
            escreva("Documento: ", documento[i], "\n")
            escreva("-----------------------------\n")
        }
    }

    escreva("Pressione ENTER para voltar...\n")
    leia(pausa)
    menu_inicial()
 }
funcao cadastro()
 {
    cadeia nome_usuario, nacionalidade_usuario
    inteiro nascimento_usuario, documento_usuario, senha_usuario

    escreva("Nome: ")
    leia(nome_usuario)

    escreva("Nacionalidade: ")
    leia(nacionalidade_usuario)

    escreva("Data de nascimento (somente números): ")
    leia(nascimento_usuario)

    escreva("Documento: ")
    leia(documento_usuario)

    escreva("Crie uma senha: ")
    leia(senha_usuario)

    nome[total_de_usuario] = nome_usuario
    nacionalidade[total_de_usuario] = nacionalidade_usuario
    nascimento[total_de_usuario] = nascimento_usuario
    documento[total_de_usuario] = documento_usuario
    senha[total_de_usuario] =  senha_usuario
    
    total_de_usuario = total_de_usuario + 1

    escreva("\nCadastro realizado com sucesso!\n")
    escreva("Faça login:\n")
    login()
 }
 
funcao sistema()
    {  
      inteiro opcao = -1
      enquanto (opcao < 0  ou  opcao > 6)
      {
        escreva("\n--- PLATAFORMA PORTA ABERTA BRASIL ---\n")
        escreva("1 - Documentação e Regularização\n")  // aqui esta feito tudo  ja 
        escreva("2 - Serviços Publicos \n") // aqui  va i sair e entrar como sub topico  dentro da função nova Serviços Publicos 
        escreva("3 - Outros\n")
        escreva("4 - Suporte\n")
        escreva("5 - Apps inportantes\n")
        escreva("6 - Meu cadrastro\n")
        escreva("0 - Sair\n")
        escreva("Escolha uma opção: ")
        leia(opcao)
      }
      escolha (opcao)
      {
       caso 1:
          menuDocumentacao()
          pare
        caso 2:
          menuServicosPublicos()
          pare
        caso 3:
          menuOutros()
          pare
        caso 4:
          menuSuporte()
          pare
        caso 5:
          menuApps()
          pare
        caso 6:
          menuCadastro()
          pare
        caso 0:
          logoff()
          pare
      }
    }

funcao menuDocumentacao()
    {   inteiro meu_documento = -1
        enquanto (meu_documento < 0 ou meu_documento > 8)
        {
        escreva("\n--- DOCUMENTAÇÃO E REGULARIZAÇÃO ---\n")
        escreva("1 - Registro Nacional Migratório (CRNM)\n")
        escreva("2 - CPF\n")
        escreva("3 - Carteira de Trabalho\n")
        escreva("4 - CNH\n")
        escreva("5 - Titulo de eleitor\n")
        escreva("6 - Nacionalidade BR\n")
        escreva("7 - Certidões\n")
        escreva("8 - Encerrar a sessão\n")
        escreva("0 - Voltar para o menu inicial\n")
        escreva("Escolha uma opção: ")
        leia (meu_documento)
        }
        escolha (meu_documento)
        {
          caso 1: 
            limpa()         
            mostrarInfoCRNM()
            pare
          caso 2:
            limpa()
            mostrarInfoCPF()
            pare
          caso 3:
            limpa()
            mostrarInfoCarteiraTrabalho()
            pare
          caso 4:
            limpa()
            mostrarInfoCNH()
            pare
          caso 5:
            limpa()
            mostrarInfoTituloEleitor()
            pare
          caso 6:
            limpa()
            mostrarInfoNacionalidadeBrasileira()
            pare
          caso 7:
            limpa()
            menuCertidoes()
            pare
          caso 8:
            limpa()
            escreva("Encerrando o programa...\n")
            pare
          caso 0:
            limpa()
            sistema()
        }
    }
funcao menuServicosPublicos ()  // 
  {
    inteiro menu_servicos = -1 
      enquanto (menu_servicos < 0 ou  menu_servicos > 4)
      {
        escreva("\n--- Serviçoes Publicos ---\n")
        escreva("1 - Saude\n")
        escreva("2 - Academico\n")
        escreva("3 - Assistência Social\n")
        escreva("4 - Finalizar pesquisa\n")
        escreva("0 - Voltar ao men inicial\n")
        escreva("Escolha uma opção: ")
        leia(menu_servicos)
      }
      escolha (menu_servicos)
      {
        caso 1:
          limpa()
          menuSaude()
          pare
        caso 2:
          limpa()
          menuEducacao()
          pare
        caso 3:
          limpa()
          menuAssistenciaSocial()
          pare
        caso 4:
          limpa()
          escreva("Encerrando o programa...\n")
          pare
        caso 0:
          limpa()
          sistema()

      }
  }

funcao menuSaude()
  {
    inteiro opcao = -1

    enquanto (opcao < 0 ou opcao > 5)
    {
        escreva("\n===== SAÚDE E BEM-ESTAR =====\n")
        escreva("1 - Cadastro no SUS\n")
        escreva("2 - UPAs\n")
        escreva("3 - Postos de Saúde por Região\n")
        escreva("4 - Hospitais\n")
        escreva("5 - Maternidades\n")
        escreva("0 - Voltar ao menu anterior\n")
        escreva("Escolha uma opção: ")
        leia(opcao)
    }

    escolha (opcao)
    {
        caso 1:
            mostrarInfoSUS()
        caso 2:
            mostrarInfoUPAs()
        caso 3:
            mostrarPostosPorRegiao()
        caso 4:
            mostrarInfoHospitais()
        caso 5:
            mostrarInfoMaternidades()
        caso 0:
            sistema()
    }
  }

funcao menuEducacao()
  {
    inteiro opcao =  -1
    cadeia pausa

    enquanto (opcao < 0 ou  opcao > 4)
    {
        escreva("\n===== MENU EDUCAÇÃO =====\n")
        escreva("1 - Creches e Educação Infantil\n")
        escreva("2 - Escolas Públicas (Ensino Fundamental e Médio)\n")
        escreva("3 - Universidades Públicas (UFSC e UDESC)\n")
        escreva("4 - ENEM e Vestibulares\n")
        escreva("5 - Educação de Jovens e Adultos (EJA)\n")
        escreva("6 - ENCCEJA (Certificação para quem não concluiu os estudos)\n")
        escreva("0 - Voltar ao menu principal\n")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha (opcao)
        {
            caso 1:
                mostrarInfoCreches()
                pare
            caso 2:
                mostrarInfoEscolas()
                pare
            caso 3:
                mostrarInfoUniversidades()
                pare
            caso 4:
                mostrarInfoEnemVestibular()
                pare
            caso 5:
                mostrarInfoEJA()
                pare
            caso 6:
                mostrarInfoENCCEJA()
                pare
            caso 0:
                sistema()
        }
    }
  }
funcao menuAssistenciaSocial()
  {
  inteiro opcao = -1

  enquanto (opcao < 0 ou  opcao > 3)
    {
        escreva("\n===== ASSISTÊNCIA SOCIAL =====\n")
        escreva("1 - CAPS (Saúde Mental e Apoio Psicossocial)\n")
        escreva("2 - CRAS (Serviços e Inclusão Social)\n")
        escreva("3 - Direitos do Imigrante\n")
        escreva("0 - Voltar ao menu principal\n")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha (opcao)
        {
            caso 1:
                limpa()
                mostrarInfoCAPS()
                pare
            caso 2:
                limpa()
                mostrarInfoCRAS()
                pare
            caso 3:
                limpa()
                mostrarInfoDireitosImigrante()
                pare
            caso 0:
                sistema()
        }
    }
}
funcao menuSuporte()
  {
    inteiro opcao = -1
    cadeia pausa

    enquanto (opcao < 0 ou  opcao > 4)
    {
        escreva("\n===== SUPORTE E COMUNIDADE =====\n")
        escreva("1 - FAQ (Perguntas Frequentes)\n")
        escreva("2 - Tire suas Dúvidas\n")
        escreva("3 - Fórum de Imigrantes\n")
        escreva("4 - Eventos e Oficinas\n")
        escreva("0 - Voltar ao menu principal\n")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha (opcao)
        {
            caso 1:
                mostrarInfoFAQ()
                pare
            caso 2:
                mostrarInfoDuvidas()
                pare
            caso 3:
                mostrarInfoForum()
                pare
            caso 4:
                mostrarInfoEventos()
                pare
            caso 0:
                sistema()
                pare
        }
    }
  }

funcao menuApps()
  {
    inteiro opcao = -1
    cadeia pausa

    enquanto (opcao < 0 ou  opcao > 4)
    {
        escreva("\n===== APLICATIVOS E FERRAMENTAS =====\n")
        escreva("1 - Gov.br\n")
        escreva("2 - Meu INSS\n")
        escreva("3 - Carteira de Trabalho Digital\n")
        escreva("4 - Apps de Transporte\n")
        escreva("0 - Voltar ao menu principal\n")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha (opcao)
        {
            caso 1:
                mostrarInfoGovBr()
                pare
            caso 2:
                mostrarInfoMeuINSS()
                pare
            caso 3:
                mostrarInfoCarteiraTrabalhoDigital()
                pare
            caso 4:
                mostrarInfoAppsTransporte()
                pare
            caso 0:
                sistema()
                pare
        }
    }
  }

funcao menuCadastro() {
    se (usuario_logado == -1) {
        escreva("Erro: nenhum usuário está logado.\n")
        menuCadastro()
    }

    inteiro opcao = -1

    enquanto (opcao < 0 ou opcao > 5) {
        escreva("\n===== MEUS DADOS CADASTRAIS =====\n")
        escreva("1 - Nome: ", nome[usuario_logado], "\n")
        escreva("2 - Nacionalidade: ", nacionalidade[usuario_logado], "\n")
        escreva("3 - Data de nascimento: ", nascimento[usuario_logado], "\n")
        escreva("4 - Número do documento: ", documento[usuario_logado], "\n")
        escreva("5 - Senha: ********\n")
        escreva("0 - Voltar\n")
        escreva("Escolha o campo que deseja alterar: ")
        leia(opcao)

        escolha(opcao) {
            caso 1:
                escreva("Novo nome: ")
                leia(nome[usuario_logado])
                escreva("Nome atualizado com sucesso!\n")
                menuCadastro()
                pare
            caso 2:
                escreva("Nova nacionalidade: ")
                leia(nacionalidade[usuario_logado])
                escreva("Nacionalidade atualizada com sucesso!\n")
                menuCadastro()
                pare
            caso 3:
                escreva("Nova data de nascimento (somente números): ")
                leia(nascimento[usuario_logado])
                escreva("Data de nascimento atualizada com sucesso!\n")
                menuCadastro()
                pare
            caso 4:
                escreva("Novo número do documento: ")
                leia(documento[usuario_logado])
                escreva("Número do documento atualizado com sucesso!\n")
                menuCadastro()
                pare
            caso 5:
                escreva("Nova senha: ")
                leia(senha[usuario_logado])
                escreva("Senha atualizada com sucesso!\n")
                menuCadastro()
                pare
            caso 0:
                escreva("Voltando ao menu principal...\n")
                sistema()
                pare
        }
    }
}
funcao menuOutros()
  {
    inteiro opcao = -1

    enquanto (opcao < 0 ou  opcao > 2)
    {
        escreva("\n===== OUTROS TEMAS =====\n")
        escreva("1 - Transporte Público\n")
        escreva("2 - Restaurantes Públicos\n")
        escreva("0 - Voltar ao menu principal\n")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha (opcao)
        {
            caso 1:
                limpa()
                mostrarInfoTransportePublico()
                pare
            caso 2:
                limpa()
                mostrarInfoRestaurantesPublicos()
                pare
            caso 0:
                sistema()
        }
    }
  }

funcao logoff()
 {
    escreva("\nVocê saiu da sua conta. Voltando para o menu inicial...\n\n")
    menu_inicial()
 }

// aqui finaliza os menus e começa as funçoes dos sub menus 
// Função menu documentação
funcao mostrarInfoCRNM()
    { cadeia pausa
      escreva("\n===== REGISTRO NACIONAL MIGRATÓRIO (CRNM) =====\n\n")

      escreva("O que é o CRNM:\n")
      escreva("O CRNM (Carteira de Registro Nacional Migratório) é o documento oficial\n")
      escreva("de identidade para estrangeiros no Brasil. Ele comprova que o imigrante\n")
      escreva("está em situação migratória regular.\n\n")

      escreva("Quem precisa tirar:\n")
      escreva("- Todo estrangeiro que vai morar no Brasil por mais de 90 dias.\n")
      escreva("- Pessoas com visto temporário, permanente, de refúgio ou estudantes.\n\n")

      escreva("Quando e onde tirar:\n")
      escreva("- Prazo: até 90 dias após a chegada ao Brasil.\n")
      escreva("- Local: unidade da Polícia Federal mais próxima.\n")
      escreva("- Agendamento: https://www.gov.br/pf\n\n")

      escreva("Documentos Necessários (podem variar):\n")
      escreva("- Passaporte válido (original e cópia)\n")
      escreva("- Formulário preenchido (disponível online)\n")
      escreva("- Comprovante de pagamento da taxa (GRU)\n")
      escreva("- Foto 3x4\n")
      escreva("- Comprovante de residência\n")
      escreva("- Documento do visto ou protocolo\n\n")

      escreva("Taxa:\n")
      escreva("- Valor médio: R$ 204,77 (verificar no site da PF)\n")
      escreva("- Paga com Guia GRU no site da Polícia Federal\n\n")

      escreva("Renovação:\n")
      escreva("- A cada 2 a 9 anos, dependendo do tipo de visto ou autorização.\n")
      escreva("- Também feita na Polícia Federal com novos documentos e taxa.\n\n")

      escreva("Se não tirar o CRNM:\n")
      escreva("- Você pode ficar irregular, ser multado ou deportado.\n")
      escreva("- Pode ter problemas para trabalhar, estudar ou usar o SUS.\n\n")

      escreva("Dúvidas e ajuda:\n")
      escreva("- Procure ONGs locais de apoio ao imigrante.\n")
      escreva("- Use o site da Polícia Federal: https://www.gov.br/pf\n")
      escreva("- A plataforma Porta Aberta Brasil também pode ajudar você.\n")
      escreva("Pressione ENTER para voltar ao menu anterior")
      leia(pausa)
      menuDocumentacao()

    }
funcao mostrarInfoCPF()
  { cadeia pausa
    escreva("\n===== CPF - Cadastro de Pessoas Físicas =====\n\n")

    escreva("O que é o CPF:\n")
    escreva("O CPF é o Cadastro de Pessoas Físicas, um documento de identificação\n")
    escreva("fiscal emitido pela Receita Federal do Brasil.\n\n")

    escreva("Quem precisa do CPF:\n")
    escreva("- Qualquer pessoa, brasileira ou estrangeira, que tenha negócios ou\n")
    escreva("  precise realizar atividades financeiras no Brasil, como abrir conta\n")
    escreva("  bancária, trabalhar formalmente, entre outros.\n\n")

    escreva("Como tirar o CPF:\n")
    escreva("- Presencialmente: em agências dos Correios, Banco do Brasil ou Caixa\n")
    escreva("  Econômica Federal, com documentos de identificação.\n")
    escreva("- Online: pelo site da Receita Federal (https://www.gov.br/receitafederal)\n\n")

    escreva("Documentos necessários:\n")
    escreva("- Documento de identificação válido (passaporte, carteira de identidade,\n")
    escreva("  carteira de motorista, etc.)\n")
    escreva("- Comprovante de residência (em alguns casos)\n\n")

    escreva("Para estrangeiros:\n")
    escreva("- O CPF pode ser solicitado mesmo antes da chegada ao Brasil.\n")
    escreva("- É importante para abrir conta, trabalhar e regularizar impostos.\n\n")

    escreva("Taxas:\n")
    escreva("- Em geral, a emissão do CPF é gratuita, especialmente se feita online.\n\n")

    escreva("Dúvidas e ajuda:\n")
    escreva("- Consulte o site oficial da Receita Federal: https://www.gov.br/receitafederal\n")
    escreva("- Procure ajuda em órgãos de atendimento ao imigrante.\n")
    escreva("Pressione ENTER para voltar ao menu anterior")
    leia(pausa)
    menuDocumentacao()
    
  }
funcao mostrarInfoCarteiraTrabalho()
  {   cadeia pausa
      escreva("\n===== CARTEIRA DE TRABALHO (CTPS) =====\n\n")

      escreva("O que é a Carteira de Trabalho:\n")
      escreva("A Carteira de Trabalho e Previdência Social (CTPS) é o documento oficial\n")
      escreva("que comprova a vida laboral do trabalhador no Brasil, registrando empregos,\n")
      escreva("contratos, direitos trabalhistas e contribuições ao INSS.\n\n")

      escreva("Quem deve solicitar:\n")
      escreva("- Todo trabalhador formal no Brasil, inclusive estrangeiros com situação\n")
      escreva("  regular.\n\n")

      escreva("Como obter a CTPS:\n")
      escreva("- Atualmente, a Carteira de Trabalho é emitida principalmente na versão\n")
      escreva("  digital, acessível pelo aplicativo \"Carteira de Trabalho Digital\".\n")
      escreva("- Também pode ser solicitada presencialmente em unidades do Ministério\n")
      escreva("  do Trabalho e Emprego ou postos autorizados.\n\n")

      escreva("Documentos necessários:\n")
      escreva("- Documento de identificação com foto (passaporte, RG, CNH, etc.)\n")
      escreva("- CPF\n")
      escreva("- Comprovante de residência\n")
      escreva("- Para estrangeiros, o Registro Nacional Migratório (CRNM) é necessário.\n\n")

      escreva("Importância:\n")
      escreva("- A CTPS garante acesso a direitos trabalhistas como FGTS, férias,\n")
      escreva("  13º salário, seguro-desemprego e aposentadoria.\n\n")

      escreva("Dúvidas e ajuda:\n")
      escreva("- Mais informações no site do Ministério do Trabalho: https://www.gov.br/trabalho\n")
      escreva("- Procure auxílio em órgãos de atendimento ao trabalhador e ONGs.\n")
      escreva("Pressione ENTER para voltar ao menu anterior")
      leia(pausa)
      menuDocumentacao()
  }
funcao mostrarInfoCNH()
  {   cadeia pausa
    escreva("\n===== CNH PARA NATURALIZADOS =====\n\n")

    escreva("O que é a CNH para naturalizados:\n")
    escreva("A Carteira Nacional de Habilitação (CNH) para naturalizados é o documento\n")
    escreva("que autoriza a pessoa, que adquiriu a nacionalidade brasileira, a dirigir veículos.\n\n")

    escreva("Quem pode solicitar:\n")
    escreva("- Estrangeiros que obtiveram a naturalização brasileira.\n\n")

    escreva("Como solicitar:\n")
    escreva("- É preciso apresentar documentos que comprovem a naturalização, como o\n")
    escreva("  Certificado de Naturalização.\n")
    escreva("- Realizar os exames exigidos pelo Departamento Estadual de Trânsito (Detran),\n")
    escreva("  incluindo provas teóricas e práticas.\n\n")

    escreva("Documentos necessários:\n")
    escreva("- Certificado de Naturalização.\n")
    escreva("- Documento de identidade com foto.\n")
    escreva("- CPF.\n")
    escreva("- Comprovante de residência.\n\n")

    escreva("Validade e renovação:\n")
    escreva("- A CNH tem validade conforme as regras gerais do Detran e deve ser renovada\n")
    escreva("  periodicamente.\n\n")

    escreva("Dúvidas e ajuda:\n")
    escreva("- Consulte o site do Detran do seu estado para informações específicas.\n")
    escreva("- Procure auxílio em órgãos de trânsito ou ONGs que atendam imigrantes.\n")
    escreva("Pressione ENTER para voltar ao menu anterior")
    leia(pausa)
    menuDocumentacao()
  }

funcao mostrarInfoTituloEleitor()
  {
    cadeia pausa

    escreva("\n===== TÍTULO DE ELEITOR E DIREITO AO VOTO =====\n\n")

    escreva("Imigrantes estrangeiros podem votar no Brasil?\n")
    escreva("Atualmente, o direito ao voto nas eleições brasileiras é exclusivo de cidadãos brasileiros.\n")
    escreva("Isso significa que pessoas estrangeiras, mesmo com residência legal, **não podem votar**\n")
    escreva("ou tirar o título de eleitor.\n\n")

    escreva("Por que isso acontece?\n")
    escreva("- A Constituição brasileira reserva o direito de voto apenas a brasileiros.\n")
    escreva("- O título de eleitor é emitido apenas para quem possui nacionalidade brasileira.\n\n")

    escreva("Mas isso não impede sua participação social:\n")
    escreva("- Você pode participar de fóruns, conselhos comunitários e debates públicos.\n")
    escreva("- Pode colaborar com ONGs, projetos sociais e ações comunitárias.\n\n")

    escreva("Importante:\n")
    escreva("- Guardar esses direitos ajuda a se preparar caso deseje se estabelecer definitivamente no país.\n")
    escreva("- O sistema político brasileiro pode afetar sua vida — mesmo como estrangeiro.\n\n")

    escreva("Para saber mais:\n")
    escreva("- Consulte órgãos oficiais como o TSE (https://www.tse.jus.br).\n")
    escreva("- Fale com ONGs de apoio ao imigrante.\n")
    escreva("- A plataforma Porta Aberta Brasil pode ajudar a esclarecer dúvidas.\n\n")

    escreva("Pressione ENTER para voltar ao menu...\n")
    leia(pausa)
    menuDocumentacao()
  }
funcao mostrarInfoNacionalidadeBrasileira()
  {
    cadeia pausa

    escreva("\n===== COMO OBTER A NACIONALIDADE BRASILEIRA =====\n\n")

    escreva("O que é nacionalidade brasileira:\n")
    escreva("É o vínculo legal e político que torna uma pessoa oficialmente cidadã do Brasil,\n")
    escreva("com todos os direitos e deveres previstos na Constituição.\n\n")

    escreva("Quem pode pedir:\n")
    escreva("- Imigrantes que vivem legalmente no Brasil há um tempo determinado.\n")
    escreva("- Filhos de estrangeiros nascidos no Brasil (em algumas situações).\n\n")

    escreva("Principais tipos de naturalização:\n")
    escreva("- Naturalização Ordinária: para quem vive no Brasil há mais de 4 anos.\n")
    escreva("- Naturalização Extraordinária: para quem vive no Brasil há mais de 15 anos ininterruptos.\n")
    escreva("- Naturalização Provisória: para menores estrangeiros que residem no país.\n\n")

    escreva("Requisitos básicos:\n")
    escreva("- Ter residência legal e contínua no Brasil.\n")
    escreva("- Saber se comunicar em português.\n")
    escreva("- Não possuir antecedentes criminais.\n")
    escreva("- Ter renda própria ou ocupação lícita.\n\n")

    escreva("Direitos de quem se torna brasileiro:\n")
    escreva("- Direito ao voto e ao título de eleitor.\n")
    escreva("- Acesso a concursos públicos e cargos públicos.\n")
    escreva("- Participação política e cidadã.\n")
    escreva("- Direito à igualdade de tratamento perante as leis.\n\n")

    escreva("Como solicitar:\n")
    escreva("- Acesse: https://www.gov.br/mj/pt-br/assuntos/seus-direitos/estrangeiros\n")
    escreva("- Preencha o formulário online e envie os documentos solicitados.\n")
    escreva("- O processo é analisado pelo Ministério da Justiça.\n\n")

    escreva("Ajuda e orientação:\n")
    escreva("- Defensoria Pública da União.\n")
    escreva("- ONGs de apoio a imigrantes.\n")
    escreva("- Plataforma Porta Aberta Brasil.\n\n")

    escreva("Pressione ENTER para voltar ao menu...\n")
    leia(pausa)
    menuDocumentacao()
  }
funcao menuCertidoes()
  {
    inteiro opcao = -1

    enquanto (opcao < 0 ou opcao > 4)
    {
        escreva("\n===== CERTIDÕES =====\n")
        escreva("1 - Certidão de Nascimento\n")
        escreva("2 - Certidão de Casamento\n")
        escreva("3 - Certidão de Óbito\n")
        escreva("4 - Certidão de Antecedentes Criminais\n")
        escreva("0 - Voltar ao menu anterior\n")
        escreva("Escolha uma opção: ")
        leia(opcao)
    }

    escolha (opcao)
    {
        caso 1:
            limpa()
            mostrarInfoCertidaoNascimento()
            pare
        caso 2:
            limpa()
            mostrarInfoCertidaoCasamento()
            pare
        caso 3:
            limpa()
            mostrarInfoCertidaoObito()
            pare
        caso 4:
            limpa()
            mostrarInfoCertidaoAntecedentes()
            pare
        caso 0:
            limpa()
            menuDocumentacao()
    }
  }
funcao mostrarInfoCertidaoNascimento()
  {
    cadeia pausa

    escreva("\n===== CERTIDÃO DE NASCIMENTO =====\n\n")

    escreva("Para que serve:\n")
    escreva("- É o primeiro documento de identificação de uma pessoa nascida no Brasil.\n")
    escreva("- Necessário para tirar CPF, matrícula escolar, SUS, etc.\n\n")

    escreva("Quem pode solicitar:\n")
    escreva("- Pais ou responsáveis por crianças nascidas no Brasil, mesmo se forem estrangeiros.\n\n")

    escreva("Onde tirar:\n")
    escreva("- No cartório de registro civil mais próximo do local de nascimento.\n")
    escreva("- Deve ser feito até 15 dias após o nascimento (prazo pode ser maior para imigrantes).\n\n")

    escreva("Documentos exigidos:\n")
    escreva("- Documento de identidade dos pais (CRNM ou passaporte).\n")
    escreva("- Declaração de nascido vivo (fornecida pelo hospital).\n\n")

    escreva("Importante:\n")
    escreva("- É gratuita se for feita dentro do prazo legal.\n")
    escreva("- A criança nascida no Brasil tem direito à certidão, mesmo que os pais sejam estrangeiros.\n\n")

    escreva("Pressione ENTER para voltar ao menu...\n")
    leia(pausa)
    menuCertidoes()
  }
funcao mostrarInfoCertidaoCasamento()
  {
    cadeia pausa

    escreva("\n===== CERTIDÃO DE CASAMENTO =====\n\n")

    escreva("Para que serve:\n")
    escreva("- Comprova oficialmente que duas pessoas estão casadas civilmente no Brasil.\n")
    escreva("- É exigida em processos de imigração, naturalização, pensões, heranças, etc.\n\n")

    escreva("Quem pode se casar no Brasil:\n")
    escreva("- Casais formados por dois brasileiros.\n")
    escreva("- Casais formados por um brasileiro e um estrangeiro.\n")
    escreva("- Casais estrangeiros com residência legal no Brasil.\n\n")

    escreva("Como registrar o casamento:\n")
    escreva("- Ir ao cartório de registro civil da cidade onde reside.\n")
    escreva("- Solicitar o processo de habilitação para casamento.\n")
    escreva("- Aguardar publicação dos proclamas (aviso público).\n\n")

    escreva("Documentos exigidos (podem variar):\n")
    escreva("- Documento de identidade (CRNM ou passaporte com tradução juramentada).\n")
    escreva("- Certidão de nascimento (original e traduzida, se for estrangeira).\n")
    escreva("- Comprovante de residência.\n")
    escreva("- Declaração de estado civil (solteiro, viúvo, divorciado).\n")
    escreva("- Se divorciado(a), apresentar certidão de casamento com averbação do divórcio.\n\n")

    escreva("Importante:\n")
    escreva("- O casamento civil é válido em todo o território nacional.\n")
    escreva("- A certidão é emitida logo após o casamento e pode ser usada para fins legais e migratórios.\n\n")

    escreva("Dúvidas e ajuda:\n")
    escreva("- Cartório de registro civil mais próximo.\n")
    escreva("- Defensoria Pública, se não puder pagar as taxas.\n")
    escreva("- Plataforma Porta Aberta Brasil.\n\n")

    escreva("Pressione ENTER para voltar ao menu...\n")
    leia(pausa)
    menuCertidoes()
  }
funcao mostrarInfoCertidaoObito()
  {
    cadeia pausa

    escreva("\n===== CERTIDÃO DE ÓBITO =====\n\n")

    escreva("Para que serve:\n")
    escreva("- A certidão de óbito é o documento oficial que comprova o falecimento de uma pessoa.\n")
    escreva("- É necessária para liberação do corpo, encerramento de CPF, inventário, pensão, etc.\n\n")

    escreva("Quem pode registrar o óbito:\n")
    escreva("- Familiares próximos do falecido.\n")
    escreva("- Hospitais, funerárias ou responsáveis legais.\n")
    escreva("- Mesmo estrangeiros podem solicitar, desde que apresentem os documentos corretos.\n\n")

    escreva("Onde registrar:\n")
    escreva("- No cartório de registro civil da cidade onde ocorreu o falecimento.\n")
    escreva("- O ideal é registrar nas primeiras 24 horas, mas o prazo pode variar.\n\n")

    escreva("Documentos exigidos (do falecido):\n")
    escreva("- Documento de identidade (CRNM, CPF, passaporte).\n")
    escreva("- Declaração de óbito fornecida pelo hospital ou médico.\n")
    escreva("- Documentos dos declarantes (quem for registrar o óbito).\n\n")

    escreva("Importante:\n")
    escreva("- A certidão é gratuita, especialmente em casos de baixa renda.\n")
    escreva("- O cartório pode orientar sobre a documentação necessária.\n")
    escreva("- Se o falecido for estrangeiro, a certidão brasileira pode ser útil para o consulado do país de origem.\n\n")

    escreva("Dúvidas e ajuda:\n")
    escreva("- Cartório de registro civil da cidade.\n")
    escreva("- Consulados estrangeiros no Brasil.\n")
    escreva("- Defensoria Pública ou ONGs de apoio em casos de vulnerabilidade.\n")
    escreva("- Plataforma Porta Aberta Brasil.\n\n")

    escreva("Pressione ENTER para voltar ao menu...\n")
    leia(pausa)
    menuCertidoes()
  }
funcao mostrarInfoCertidaoAntecedentes()
  {
    cadeia pausa

    escreva("\n===== CERTIDÃO DE ANTECEDENTES CRIMINAIS =====\n\n")

    escreva("Para que serve:\n")
    escreva("- Comprova que uma pessoa não possui antecedentes criminais no Brasil.\n")
    escreva("- Exigida em processos de imigração, naturalização, emprego e estudos.\n\n")

    escreva("Quem pode solicitar:\n")
    escreva("- Qualquer pessoa com documentos válidos no Brasil.\n")
    escreva("- Imigrantes com CRNM ou passaporte podem emitir a certidão.\n\n")

    escreva("Onde solicitar:\n")
    escreva("- Pelo site da Polícia Federal: https://www.gov.br/pf\n")
    escreva("- Ou pela Polícia Civil do estado (quando for exigência estadual).\n\n")

    escreva("Documentos exigidos:\n")
    escreva("- CRNM (Carteira de Registro Nacional Migratório) ou passaporte válido.\n")
    escreva("- Dados pessoais como nome completo, filiação, data de nascimento e nacionalidade.\n\n")

    escreva("Como funciona:\n")
    escreva("- A certidão federal pode ser emitida online de forma gratuita.\n")
    escreva("- A estadual pode ser feita em delegacias ou site da Secretaria de Segurança Pública do estado.\n")
    escreva("- Em geral, o documento é emitido na hora e tem validade de 90 dias.\n\n")

    escreva("Importante:\n")
    escreva("- Em caso de registro de ocorrências, a certidão pode mostrar restrições.\n")
    escreva("- Se houver erro, procure corrigir junto à polícia ou Defensoria Pública.\n\n")

    escreva("Ajuda e mais informações:\n")
    escreva("- Site da Polícia Federal: https://www.gov.br/pf\n")
    escreva("- Secretaria de Segurança Pública do seu estado.\n")
    escreva("- Plataforma Porta Aberta Brasil.\n\n")

    escreva("Pressione ENTER para voltar ao menu...\n")
    leia(pausa)
    menuCertidoes()
  }



//Função menu Saúde
funcao mostrarInfoSUS()
  {
    cadeia pausa

    escreva("\n===== CADASTRO NO SUS (Sistema Único de Saúde) =====\n\n")

    escreva("O que é o SUS:\n")
    escreva("O SUS é o sistema público de saúde do Brasil. Ele oferece serviços médicos\n")
    escreva("gratuitos para toda a população, inclusive imigrantes.\n\n")

    escreva("Quem pode usar:\n")
    escreva("- Todos os residentes no Brasil, inclusive estrangeiros em situação regular.\n")
    escreva("- Não é necessário ter cidadania brasileira.\n\n")

    escreva("Como fazer o cadastro:\n")
    escreva("- Vá até a Unidade Básica de Saúde (UBS) mais próxima.\n")
    escreva("- Solicite o Cartão SUS (ou CNS - Cartão Nacional de Saúde).\n")
    escreva("- O cadastro é simples e gratuito.\n\n")

    escreva("Documentos necessários:\n")
    escreva("- Documento de identidade (passaporte, CRNM ou RNE).\n")
    escreva("- CPF (se tiver).\n")
    escreva("- Comprovante de residência.\n\n")

    escreva("Benefícios do SUS:\n")
    escreva("- Atendimento médico e hospitalar.\n")
    escreva("- Consultas, exames, cirurgias e vacinas.\n")
    escreva("- Urgência e emergência.\n")
    escreva("- Saúde mental e programas de prevenção.\n\n")

    escreva("Dúvidas e ajuda:\n")
    escreva("- Pergunte na UBS mais próxima da sua casa.\n")
    escreva("- Site oficial: https://www.gov.br/saude\n")
    escreva("- A plataforma Porta Aberta Brasil também pode te orientar.\n\n")

    escreva("Pressione ENTER para voltar ao menu...\n")
    leia(pausa)
    menuSaude()
  }
funcao mostrarInfoUPAs()
  {
    cadeia pausa

    escreva("\n===== UNIDADES DE PRONTO ATENDIMENTO (UPAs) =====\n\n")

    escreva("O que são as UPAs:\n")
    escreva("- As UPAs são unidades de saúde que oferecem atendimento de urgência e emergência.\n")
    escreva("- Funcionam 24 horas para casos que não precisam ser levados ao hospital.\n\n")

    escreva("Para que servem:\n")
    escreva("- Atendimento rápido para sintomas como febre alta, dor intensa, acidentes leves,\n")
    escreva("  problemas respiratórios, entre outros.\n\n")

    escreva("Principais UPAs em Florianópolis:\n")
    escreva("UPA NORTE\n")
    escreva("Endereço: R. Francisco Faustino Martins, s/n - Vargem Grande, Florianópolis - SC, 88010-102\n")
    escreva("Telefones: (48) 3261-0614, (48) 3261-0616, (48) 3261-0613, (48) 3261-0615\n")
    escreva("Horário de atendimento: 24h todos os dias da semana\n\n")

    escreva("UPA SUL\n")
    escreva("Endereço: Avenida Deputado Diomício Freitas, 3393 - Carianos\n")
    escreva("Telefone: (48) 3239-1701\n")
    escreva("Horário de atendimento: 24h todos os dias da semana\n\n")

    escreva("UPA CONTINENTE\n")
    escreva("Endereço: Rua Gualberto Senna, 300 - Jardim Atlântico, Florianópolis - SC, 88095-256\n")
    escreva("Telefone: (48) 3380-6785\n")
    escreva("Horário de atendimento: 24h todos os dias da semana\n\n")

    escreva("Como usar:\n")
    escreva("- Vá até a UPA mais próxima com documento e cartão do SUS, se tiver.\n")
    escreva("- O atendimento é gratuito e aberto para toda população.\n\n")

    escreva("Dicas importantes:\n")
    escreva("- Em casos graves, chame o SAMU pelo número 192.\n")
    escreva("- Para consultas e tratamentos não urgentes, prefira os postos de saúde.\n\n")

    escreva("Pressione ENTER para voltar ao menu...\n")
    leia(pausa)
    menuSaude()
  }

funcao mostrarPostosPorRegiao()
  {
    cadeia pausa

    escreva("\n===== POSTOS DE SAÚDE POR REGIÃO EM FLORIANÓPOLIS =====\n\n")

    escreva("O que é um Posto de Saúde?\n")
    escreva("O Posto de Saúde é a unidade básica da rede pública de saúde, responsável por atender a população em cuidados primários.\n")
    escreva("Eles funcionam como a porta de entrada do sistema de saúde, oferecendo atendimento preventivo, tratamento de doenças comuns,\n")
    escreva("acompanhamento de gestantes, vacinação, atendimento infantil, e suporte para condições crônicas.\n\n")

    escreva("O que pode ser atendido no Posto de Saúde?\n")
    escreva("- Consultas médicas e de enfermagem para problemas de saúde geral.\n")
    escreva("- Vacinação para crianças, adultos e idosos.\n")
    escreva("- Pré-natal e acompanhamento de gestantes.\n")
    escreva("- Controle e tratamento de doenças crônicas, como diabetes e hipertensão.\n")
    escreva("- Serviços de saúde bucal.\n")
    escreva("- Orientação em saúde e promoção do bem-estar.\n")
    escreva("- Encaminhamento para especialistas e hospitais, quando necessário.\n\n")

    escreva("--- REGIÃO NORTE ---\n")
    escreva("Posto de Saúde Vargem Grande\n")
    escreva("Endereço: Rua João Pio Duarte Silva, 123 - Vargem Grande\n")
    escreva("Telefone: (48) 3261-1234\n")
    escreva("Horário: Segunda a sexta, das 8h às 17h\n\n")

    escreva("Posto de Saúde Ingleses\n")
    escreva("Endereço: Rua Antônio João, 456 - Ingleses\n")
    escreva("Telefone: (48) 3261-5678\n")
    escreva("Horário: Segunda a sexta, das 8h às 17h\n\n")

    escreva("--- REGIÃO SUL ---\n")
    escreva("Posto de Saúde Carianos\n")
    escreva("Endereço: Avenida Deputado Diomício Freitas, 111 - Carianos\n")
    escreva("Telefone: (48) 3239-1701\n")
    escreva("Horário: Segunda a sexta, das 8h às 17h\n\n")

    escreva("Posto de Saúde Córrego Grande\n")
    escreva("Endereço: Rua José Carlos Pereira, 222 - Córrego Grande\n")
    escreva("Telefone: (48) 3261-6789\n")
    escreva("Horário: Segunda a sexta, das 8h às 17h\n\n")

    escreva("--- REGIÃO LESTE ---\n")
    escreva("Posto de Saúde Trindade\n")
    escreva("Endereço: Rua Engenheiro Caldas, 444 - Trindade\n")
    escreva("Telefone: (48) 3261-1111\n")
    escreva("Horário: Segunda a sexta, das 8h às 17h\n\n")

    escreva("Posto de Saúde Estreito\n")
    escreva("Endereço: Rua Dona Francisca, 555 - Estreito\n")
    escreva("Telefone: (48) 3261-2222\n")
    escreva("Horário: Segunda a sexta, das 8h às 17h\n\n")

    escreva("--- REGIÃO CENTRO-OESTE ---\n")
    escreva("Posto de Saúde Centro\n")
    escreva("Endereço: Rua Felipe Schmidt, 777 - Centro\n")
    escreva("Telefone: (48) 3261-3333\n")
    escreva("Horário: Segunda a sexta, das 8h às 17h\n\n")

    escreva("Posto de Saúde Agronômica\n")
    escreva("Endereço: Rua Lauro Linhares, 888 - Agronômica\n")
    escreva("Telefone: (48) 3261-4444\n")
    escreva("Horário: Segunda a sexta, das 8h às 17h\n\n")

    escreva("Pressione ENTER para voltar ao menu Saúde...\n")
    leia(pausa)
    menuSaude()
  }
funcao mostrarInfoHospitais()
  {
    cadeia pausa

    escreva("\n===== HOSPITAIS PÚBLICOS EM FLORIANÓPOLIS E GRANDE FLORIANÓPOLIS =====\n\n")

    escreva("Os hospitais públicos são unidades de saúde mantidas pelo governo, que oferecem atendimento gratuito à população.\n")
    escreva("Eles prestam serviços de emergência, internação, cirurgias, atendimentos especializados, exames e suporte a casos de maior complexidade.\n\n")

    escreva("---- FLORIANÓPOLIS ----\n")
    escreva("Hospital Governador Celso Ramos\n")
    escreva("Endereço: Rua General Eurico Gaspar Dutra, 280 - Centro\n")
    escreva("Telefone: (48) 3261-5000\n")
    escreva("Atendimento: 24 horas, emergência, internação, cirurgias, atendimento clínico\n\n")

    escreva("Hospital Universitário Polydoro Ernani de São Thiago\n")
    escreva("Endereço: Rua Eng. Agronômico Andrei Cristian Ferreira, s/n - Trindade\n")
    escreva("Telefone: (48) 3721-9200\n")
    escreva("Atendimento: 24 horas, emergências, atendimentos especializados, ensino e pesquisa\n\n")

    escreva("Hospital Baía Sul\n")
    escreva("Endereço: Rua Doutor Américo Vespúcio, 500 - Centro\n")
    escreva("Telefone: (48) 3261-1000\n")
    escreva("Atendimento: 24 horas, emergências, internação, cirurgias\n\n")

    escreva("---- GRANDE FLORIANÓPOLIS ----\n")
    escreva("Hospital Regional de São José\n")
    escreva("Endereço: Rua Pedro Paulo de Moraes, 1085 - São José\n")
    escreva("Telefone: (48) 3209-1000\n")
    escreva("Atendimento: 24 horas, emergência, internação, cirurgias\n\n")

    escreva("Hospital Municipal de Biguaçu\n")
    escreva("Endereço: Rua Geraldo Schimanski, 450 - Biguaçu\n")
    escreva("Telefone: (48) 3247-2000\n")
    escreva("Atendimento: 24 horas, emergência, atendimento clínico\n\n")

    escreva("Pressione ENTER para voltar ao menu Saúde...\n")
    leia(pausa)
    menuSaude()
  }
funcao mostrarInfoMaternidades()
  {
    cadeia pausa

    escreva("\n===== MATERNIDADES PÚBLICAS EM FLORIANÓPOLIS E GRANDE FLORIANÓPOLIS =====\n\n")

    escreva("As maternidades públicas oferecem atendimento pré-natal, parto humanizado, acompanhamento pós-parto e cuidados neonatais gratuitos para gestantes.\n\n")

    escreva("---- FLORIANÓPOLIS ----\n")
    escreva("Maternidade Carmela Dutra\n")
    escreva("Endereço: Rua Padre Romeu Strasser, 300 - Trindade\n")
    escreva("Telefone: (48) 3721-9300\n")
    escreva("Atendimento: 24 horas, partos normais e cesarianas, pré-natal\n\n")

    escreva("---- GRANDE FLORIANÓPOLIS ----\n")
    escreva("Maternidade Municipal São José\n")
    escreva("Endereço: Rua Coronel Marcos Konder, 200 - São José\n")
    escreva("Telefone: (48) 3209-2000\n")
    escreva("Atendimento: 24 horas, partos, acompanhamento pré-natal\n\n")

    escreva("Pressione ENTER para voltar ao menu Saúde...\n")
    leia(pausa)
    menuSaude()
  }



//Função menu educação
funcao mostrarInfoCreches()
  {
    cadeia pausa

    escreva("\n===== CRECHES E EDUCAÇÃO INFANTIL =====\n\n")

    escreva("A Educação Infantil pública em Florianópolis é ofertada pela rede municipal\n")
    escreva("em Centros de Educação Infantil (CEIs), para crianças de 0 a 5 anos.\n\n")

    escreva("O que são os CEIs?\n")
    escreva("São unidades que atendem crianças em creche (0 a 3 anos) e pré-escola (4 e 5 anos).\n")
    escreva("Eles oferecem alimentação, cuidados, atividades pedagógicas e desenvolvimento integral.\n\n")

    escreva("Como solicitar uma vaga?\n")
    escreva("- O cadastro deve ser feito pela internet no site da Prefeitura de Florianópolis.\n")
    escreva("- O sistema funciona em períodos de inscrição divulgados publicamente.\n")
    escreva("- É necessário apresentar documentos como certidão de nascimento da criança,\n")
    escreva("  comprovante de residência, documentos dos responsáveis e comprovante de renda.\n\n")

    escreva("Critérios de Prioridade:\n")
    escreva("- Crianças em situação de vulnerabilidade social\n")
    escreva("- Famílias com menor renda\n")
    escreva("- Crianças com deficiência\n")
    escreva("- Mães solo que trabalham e estudam\n\n")

    escreva("Mais informações:\n")
    escreva("- Site: https://creche.pmf.sc.gov.br\n")
    escreva("- Secretaria Municipal de Educação: (48) 3212-0923\n")

    escreva("\nPressione ENTER para voltar ao menu Educação...\n")
    leia(pausa)
    menuEducacao()
  }
funcao mostrarInfoEscolas()
  {
    cadeia pausa

    escreva("\n===== ESCOLAS PÚBLICAS (ENSINO FUNDAMENTAL E MÉDIO) =====\n\n")

    escreva("A rede pública de ensino em Florianópolis atende gratuitamente alunos do Ensino\n")
    escreva("Fundamental (1º ao 9º ano) e Ensino Médio (1º ao 3º ano) em escolas estaduais e municipais.\n\n")

    escreva("Ensino Fundamental:\n")
    escreva("- Etapas: Anos iniciais (1º ao 5º ano) e anos finais (6º ao 9º ano)\n")
    escreva("- Oferecido principalmente pela rede municipal\n")
    escreva("- Crianças a partir de 6 anos devem ser matriculadas obrigatoriamente\n\n")

    escreva("Ensino Médio:\n")
    escreva("- Etapas: 1º ao 3º ano\n")
    escreva("- Responsabilidade da rede estadual de ensino (Secretaria de Estado da Educação)\n")
    escreva("- Gratuito e obrigatório até os 17 anos\n\n")

    escreva("Como fazer a matrícula?\n")
    escreva("- As inscrições são feitas anualmente por meio do site da Prefeitura ou da Secretaria Estadual de Educação\n")
    escreva("- É necessário apresentar RG, CPF, histórico escolar, comprovante de residência e vacinação\n")
    escreva("- Crianças imigrantes têm direito à matrícula mesmo sem todos os documentos inicialmente\n\n")

    escreva("Importante:\n")
    escreva("- É possível solicitar transferência entre escolas próximas\n")
    escreva("- Imigrantes que não falam português têm direito a apoio pedagógico e tradutores em algumas unidades\n\n")

    escreva("Sites úteis:\n")
    escreva("- Matrícula municipal: https://matricula.pmf.sc.gov.br\n")
    escreva("- Matrícula estadual: https://www.sed.sc.gov.br\n")
    escreva("- Secretaria de Educação SC: (48) 3664-8400\n")

    escreva("\nPressione ENTER para voltar ao menu Educação...\n")
    leia(pausa)
    menuEducacao()
  }
funcao mostrarInfoUniversidades()
  {
    cadeia pausa

    escreva("\n===== UNIVERSIDADES PÚBLICAS EM FLORIANÓPOLIS =====\n\n")

    escreva("Florianópolis abriga duas grandes universidades públicas com ensino gratuito:\n")
    escreva("a Universidade Federal de Santa Catarina (UFSC) e a Universidade do Estado de SC (UDESC).\n\n")

    escreva("🟢 UFSC - Universidade Federal de Santa Catarina\n")
    escreva("- Ensino superior gratuito e de qualidade\n")
    escreva("- Oferece cursos de graduação, pós-graduação, mestrado e doutorado\n")
    escreva("- Campus principal: Bairro Trindade, Florianópolis\n")
    escreva("- Possui cotas para estudantes de escola pública, pretos, pardos, indígenas e imigrantes refugiados\n")
    escreva("- Site: https://ufsc.br\n\n")

    escreva("🟢 UDESC - Universidade do Estado de Santa Catarina\n")
    escreva("- Ensino superior gratuito mantido pelo governo estadual\n")
    escreva("- Cursos de licenciatura, bacharelado e pós-graduação\n")
    escreva("- Campus principal: Bairro Itacorubi, Florianópolis\n")
    escreva("- Também conta com políticas de cotas sociais e ações afirmativas\n")
    escreva("- Site: https://www.udesc.br\n\n")

    escreva("Como ingressar:\n")
    escreva("- Por vestibular próprio da UFSC ou UDESC\n")
    escreva("- Pela nota do ENEM (Sistema de Seleção Unificada – SISU)\n")
    escreva("- Algumas vagas podem ser acessadas por refugiados ou imigrantes em situação especial\n\n")

    escreva("Apoio para imigrantes:\n")
    escreva("- A UFSC possui o Núcleo de Apoio a Estudantes Imigrantes e Refugiados (NAEIR)\n")
    escreva("- A universidade oferece cursos de português, auxílio financeiro e acompanhamento pedagógico\n\n")

    escreva("Pressione ENTER para voltar ao menu Educação...\n")
    leia(pausa)
    menuEducacao()
  }
funcao mostrarInfoEnemVestibular()
  {
    cadeia pausa

    escreva("\n===== ENEM E VESTIBULARES =====\n\n")

    escreva("O Exame Nacional do Ensino Médio (ENEM) é uma das principais formas de acesso\n")
    escreva("ao ensino superior no Brasil. Ele é usado por universidades públicas e privadas.\n\n")

    escreva("📘 O que é o ENEM?\n")
    escreva("- Uma prova aplicada anualmente pelo governo federal.\n")
    escreva("- Avalia conhecimentos das áreas do ensino médio.\n")
    escreva("- Tem 2 dias de prova com 180 questões e uma redação.\n\n")

    escreva("📌 Como o ENEM é utilizado:\n")
    escreva("- SISU: Sistema de Seleção Unificada para universidades públicas (como UFSC e IFSC)\n")
    escreva("- PROUNI: bolsas de estudo em faculdades privadas\n")
    escreva("- FIES: financiamento estudantil para pagar faculdades privadas\n\n")

    escreva("📘 Vestibulares das Universidades:\n")
    escreva("- UFSC e UDESC também aplicam vestibulares próprios com provas objetivas e redação\n")
    escreva("- Em alguns casos, aceitam a nota do ENEM como parte do processo\n\n")

    escreva("🎓 Imigrantes e Refugiados:\n")
    escreva("- Podem se inscrever normalmente no ENEM, mesmo sem CPF brasileiro (usando passaporte)\n")
    escreva("- Algumas universidades têm políticas de acesso específicas para refugiados\n")
    escreva("- Imigrantes em situação regular podem concorrer a vagas normalmente\n\n")

    escreva("ℹ️ Inscrições e Informações:\n")
    escreva("- Site do ENEM: https://enem.inep.gov.br\n")
    escreva("- SISU: https://sisu.mec.gov.br\n")
    escreva("- Vestibular UFSC: https://vestibular.ufsc.br\n")
    escreva("- Vestibular UDESC: https://vestibular.udesc.br\n")

    escreva("\nPressione ENTER para voltar ao menu Educação...\n")
    leia(pausa)
    menuEducacao()
  }
funcao mostrarInfoEJA()
  {
    cadeia pausa

    escreva("\n===== EDUCAÇÃO DE JOVENS E ADULTOS (EJA) =====\n\n")

    escreva("A EJA é uma modalidade de ensino voltada para pessoas que não concluíram\n")
    escreva("o Ensino Fundamental ou Médio na idade apropriada. É uma forma de retomar\n")
    escreva("os estudos e obter certificação gratuita pela rede pública.\n\n")

    escreva("Quem pode estudar pela EJA?\n")
    escreva("- Pessoas com 15 anos ou mais para o Ensino Fundamental\n")
    escreva("- Pessoas com 18 anos ou mais para o Ensino Médio\n")
    escreva("- Imigrantes também podem participar, mesmo que estejam regularizando seus documentos\n\n")

    escreva("Como funciona:\n")
    escreva("- Aulas geralmente à noite, com conteúdos adaptados para adultos\n")
    escreva("- Pode ser presencial ou à distância, dependendo da escola\n")
    escreva("- Duração reduzida em relação ao ensino tradicional\n\n")

    escreva("Como se inscrever:\n")
    escreva("- Procure uma escola pública com turmas de EJA\n")
    escreva("- Leve RG (ou passaporte), CPF (se tiver), comprovante de residência e histórico escolar (se tiver)\n")
    escreva("- A matrícula é gratuita\n\n")

    escreva("Onde encontrar turmas:\n")
    escreva("- Consulte a Secretaria de Educação do seu município\n")
    escreva("- Florianópolis: https://educa.pmf.sc.gov.br ou (48) 3212-0923\n")
    escreva("- Também há unidades estaduais com EJA: https://www.sed.sc.gov.br\n\n")

    escreva("Pressione ENTER para voltar ao menu Educação...\n")
    leia(pausa)
    menuEducacao()
  }
funcao mostrarInfoENCCEJA()
  {
    cadeia pausa

    escreva("\n===== ENCCEJA - CERTIFICAÇÃO PARA JOVENS E ADULTOS =====\n\n")

    escreva("O ENCCEJA (Exame Nacional para Certificação de Competências de Jovens e Adultos)\n")
    escreva("é uma prova gratuita do governo federal para quem deseja obter o certificado\n")
    escreva("de conclusão do Ensino Fundamental ou Médio.\n\n")

    escreva("Quem pode fazer?\n")
    escreva("- Ensino Fundamental: pessoas com 15 anos ou mais\n")
    escreva("- Ensino Médio: pessoas com 18 anos ou mais\n")
    escreva("- Imigrantes e refugiados também podem participar, mesmo sem histórico escolar completo\n\n")

    escreva("Como funciona:\n")
    escreva("- Prova aplicada uma vez por ano, com quatro áreas do conhecimento e uma redação\n")
    escreva("- Se atingir a nota mínima em todas as áreas, recebe o certificado\n")
    escreva("- Pode fazer por partes e ir completando aos poucos\n\n")

    escreva("Inscrição:\n")
    escreva("- Online, no site do INEP: https://enccejanacional.inep.gov.br\n")
    escreva("- É necessário um número de CPF, mas imigrantes podem solicitar CPF provisório ou usar documento alternativo\n")
    escreva("- Escolha uma instituição certificadora (geralmente escolas estaduais ou IFSC)\n\n")

    escreva("Documentos necessários para retirar o certificado:\n")
    escreva("- Documento de identidade válido\n")
    escreva("- Resultado do exame (disponível no site)\n")
    escreva("- Solicitação feita à instituição escolhida no momento da inscrição\n\n")

    escreva("Importante:\n")
    escreva("- O ENCCEJA substitui o antigo supletivo\n")
    escreva("- É aceito em todo o Brasil para estudar, trabalhar ou prestar concursos\n\n")

    escreva("Pressione ENTER para voltar ao menu Educação...\n")
    leia(pausa)
    menuEducacao()
  }





//Função menu Serviço social
funcao mostrarInfoCAPS()
  {
    cadeia pausa

    escreva("\n===== CAPS (CENTRO DE ATENÇÃO PSICOSSOCIAL) =====\n\n")

    escreva("O CAPS é um serviço público de saúde mental que oferece atendimento especializado\n")
    escreva("para pessoas com transtornos mentais e necessidades de reabilitação psicossocial.\n\n")

    escreva("Serviços oferecidos:\n")
    escreva("- Atendimento psicológico e psiquiátrico\n")
    escreva("- Acompanhamento individual e em grupo\n")
    escreva("- Oficinas terapêuticas, atividades culturais e sociais\n")
    escreva("- Apoio à família e à reinserção social e laboral\n\n")

    escreva("Locais de atendimento em Florianópolis:\n")
    escreva("1. CAPS Adulto - Centro\n")
    escreva("   Endereço: Rua Tenente Silveira, 108 - Centro\n")
    escreva("   Telefone: (48) 3251-2345\n\n")

    escreva("2. CAPS Infantil - Estreito\n")
    escreva("   Endereço: Rua Deputado Antônio Edu Vieira, 1310 - Estreito\n")
    escreva("   Telefone: (48) 3261-7890\n\n")

    escreva("3. CAPS Álcool e Drogas - Trindade\n")
    escreva("   Endereço: Rua Engenheiro Antonio Correia Pinto de Macedo, 75 - Trindade\n")
    escreva("   Telefone: (48) 3333-4567\n\n")

    escreva("Para acessar os serviços do CAPS, procure o centro mais próximo ou vá a uma unidade básica de saúde para encaminhamento.\n\n")

    escreva("Pressione ENTER para voltar ao menu Assistência Social...\n")
    leia(pausa)
    menuAssistenciaSocial()
  }
funcao mostrarInfoCRAS()
  {
    cadeia pausa

    escreva("\n===== CRAS (CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL) =====\n\n")

    escreva("O CRAS é a porta de entrada para os serviços socioassistenciais no Brasil.\n")
    escreva("Ele oferece atendimento e acompanhamento para famílias em situação de vulnerabilidade social.\n\n")

    escreva("Serviços oferecidos:\n")
    escreva("- Cadastro no Cadastro Único para programas sociais\n")
    escreva("- Acompanhamento social e apoio psicossocial\n")
    escreva("- Oficinas, cursos e atividades comunitárias\n")
    escreva("- Encaminhamento para programas de transferência de renda e benefícios sociais\n\n")

    escreva("Locais de atendimento em Florianópolis divididos por região:\n\n")

    escreva("Norte:\n")
    escreva("- CRAS Saco Grande - Rua Deputado Antônio Edu Vieira, 245 - Saco Grande\n")
    escreva("- CRAS Itacorubi - Rua Francisco Lima, 150 - Itacorubi\n\n")

    escreva("Sul:\n")
    escreva("- CRAS Tapera - Rua Alexandre Ferronato, 780 - Tapera\n")
    escreva("- CRAS Campinas - Rua Dr. João Carlos Formiga, 50 - Campinas\n\n")

    escreva("Leste:\n")
    escreva("- CRAS Coqueiros - Rua Bocaiuva, 123 - Coqueiros\n")
    escreva("- CRAS Córrego Grande - Rua Orfanatrófio, 200 - Córrego Grande\n\n")

    escreva("Oeste:\n")
    escreva("- CRAS Capoeiras - Rua Vereador Pedro Francisco da Silva, 320 - Capoeiras\n")
    escreva("- CRAS Monte Verde - Rua Vereador João Zimerer, 540 - Monte Verde\n\n")

    escreva("Para ser atendido, procure o CRAS da sua região levando documentos pessoais e comprovante de residência.\n\n")

    escreva("Pressione ENTER para voltar ao menu Assistência Social...\n")
    leia(pausa)
    menuAssistenciaSocial()
  }
funcao mostrarInfoDireitosImigrante()
  { 
    cadeia pausa

    escreva("\n===== DIREITOS DO IMIGRANTE NO BRASIL =====\n\n")

    escreva("Os imigrantes no Brasil têm direitos garantidos por lei para assegurar sua integração e proteção.\n\n")

    escreva("Principais direitos:\n")
    escreva("- Direito à documentação e regularização migratória\n")
    escreva("- Acesso ao Sistema Único de Saúde (SUS)\n")
    escreva("- Direito à educação, desde a creche até o ensino superior\n")
    escreva("- Direito ao trabalho e à carteira assinada\n")
    escreva("- Acesso à assistência social e programas de inclusão\n")
    escreva("- Proteção contra discriminação e xenofobia\n\n")

    escreva("Serviços de apoio em Florianópolis:\n")
    escreva("- Defensoria Pública: orientação jurídica gratuita para imigrantes\n")
    escreva("- ONGs locais que oferecem apoio e orientação\n")
    escreva("- Secretaria Municipal de Direitos Humanos e Cidadania\n\n")

    escreva("Locais de atendimento:\n")
    escreva("- Defensoria Pública Estadual - Rua Deputado Antônio Edu Vieira, 500 - Centro\n")
    escreva("- Casa do Imigrante - Rua General Eurico Gaspar Dutra, 123 - Trindade\n")
    escreva("- CRAS e CAPS da região também oferecem suporte\n\n")

    escreva("Para mais informações, procure estes locais ou acesse a plataforma Porta Aberta Brasil.\n\n")

    escreva("Pressione ENTER para voltar ao menu Assistência Social...\n")
    leia(pausa)
    menuAssistenciaSocial()
  }


//Função menu Outros
funcao mostrarInfoTransportePublico()
 {
    cadeia pausa

    escreva("\n===== TRANSPORTE PÚBLICO EM FLORIANÓPOLIS =====\n\n")

    escreva("O transporte público de Florianópolis é operado por ônibus integrados entre bairros e terminais.\n")
    escreva("A administração é feita pelo SETUF (Sindicato das Empresas de Transporte Urbano da Grande Florianópolis).\n\n")

    escreva("🚌 Ônibus na Ilha:\n")
    escreva("- Atendem os bairros da Ilha de Santa Catarina.\n")
    escreva("- Operam com integração entre os terminais TITRI, TICAN, TILAG, TIRIO, e TICEN.\n\n")

    escreva("🚌 Ônibus no Continente:\n")
    escreva("- A conexão entre a Ilha e o Continente é feita pelo TICEN (Centro).\n\n")

    escreva("🎫 Como pagar:\n")
    escreva("- Cartão do Transporte SETUF (disponível nos terminais)\n")
    escreva("- Também é possível pagar em dinheiro no ônibus\n\n")

    escreva("🏢 Terminais de Integração:\n")
    escreva("- TICEN: Terminal Integrado do Centro – conexão entre todas as regiões\n")
    escreva("- TITRI: Trindade – região central e UFSC\n")
    escreva("- TILAG: Lagoa da Conceição – região leste\n")
    escreva("- TICAN: Canasvieiras – região norte\n")
    escreva("- TIRIO: Rio Tavares – região sul\n")
    escreva("- TISAN: Capoeiras – atende exclusivamente a região continental\n\n")

    escreva("🔍 Para saber linhas e horários:\n")
    escreva("- Acesse o site: https://www.pmf.sc.gov.br/entidades/setuf\n")
    escreva("- Ou utilize apps como Google Maps, Moovit ou Floripanoponto\n\n")

    escreva("Pressione ENTER para voltar ao menu Outros...\n")
    leia(pausa)
    menuOutros()
 }
funcao mostrarInfoRestaurantesPublicos()
  {
    cadeia pausa

    escreva("\n===== RESTAURANTES PÚBLICOS EM FLORIANÓPOLIS =====\n\n")

    escreva("Os restaurantes populares são espaços mantidos pelo poder público\n")
    escreva("para garantir alimentação saudável, de qualidade e a baixo custo\n")
    escreva("para a população em situação de vulnerabilidade e trabalhadores em geral.\n\n")

    escreva("Quem pode usar:\n")
    escreva("- Qualquer pessoa pode acessar, não é necessário cadastro\n")
    escreva("- Pessoas em situação de rua, trabalhadores e estudantes são o público principal\n\n")

    escreva("Cardápio e Alimentação:\n")
    escreva("- Alimentação balanceada com arroz, feijão, carne, salada, fruta e bebida\n")
    escreva("- O cardápio varia por dia e é elaborado por nutricionistas\n\n")

    escreva("Preço médio:\n")
    escreva("- Em geral, o valor por refeição é entre R$ 2,00 e R$ 4,00\n")
    escreva("- Pode ser gratuito para pessoas em situação de rua, dependendo da política local\n\n")

    escreva("Unidades em Florianópolis:\n")
    escreva("1. Restaurante Popular Centro\n")
    escreva("   Endereço: Rua Álvaro Millen da Silveira, 158 – Centro\n")
    escreva("   Horário: Segunda a sexta, das 11h às 13h30\n\n")

    escreva("2. Cozinha Comunitária da Coloninha\n")
    escreva("   Endereço: Rua General Eurico Gaspar Dutra, 500 – Coloninha\n")
    escreva("   Horário: Atendimento prioritário a famílias em situação de risco\n\n")

    escreva("Para mais informações, entre em contato com a Secretaria Municipal de Assistência Social\n")
    escreva("ou consulte o site da Prefeitura de Florianópolis: https://www.pmf.sc.gov.br\n\n")

    escreva("Pressione ENTER para voltar ao menu Outros...\n")
    leia(pausa)
    menuOutros()
  }



//Função menu suporte
funcao mostrarInfoFAQ()
  {
    cadeia pausa

    escreva("\n===== FAQ - PERGUNTAS FREQUENTES =====\n\n")

    escreva("1. Preciso falar português para ser atendido no SUS?\n")
    escreva("Não é obrigatório. Muitos locais oferecem ajuda com tradução ou intérprete,\n")
    escreva("e você pode levar alguém de confiança para ajudar.\n\n")

    escreva("2. Posso estudar no Brasil mesmo sem ter todos os documentos?\n")
    escreva("Sim. Crianças e adolescentes têm direito à educação pública gratuita,\n")
    escreva("mesmo se a documentação estiver incompleta. Procure uma escola próxima e explique sua situação.\n\n")

    escreva("3. Tenho direito a trabalhar mesmo sendo imigrante?\n")
    escreva("Sim, desde que esteja com sua situação migratória regularizada e tenha CPF e CRNM (ou protocolo).\n\n")

    escreva("4. Como posso aprender português gratuitamente?\n")
    escreva("Várias ONGs, universidades e escolas públicas oferecem cursos gratuitos de português para imigrantes.\n")
    escreva("Consulte a plataforma Porta Aberta Brasil para saber onde encontrar.\n\n")

    escreva("5. Posso acessar benefícios sociais como o Bolsa Família?\n")
    escreva("Sim, se estiver com CPF válido e cadastro no CadÚnico. Procure um CRAS próximo para se informar.\n\n")

    escreva("6. O que é o CRNM e onde faço?\n")
    escreva("É o Registro Nacional Migratório, feito na Polícia Federal. É o documento principal do imigrante no Brasil.\n\n")

    escreva("Essas e outras perguntas também estão disponíveis no site oficial da plataforma e na Central de Atendimento.\n\n")

    escreva("Pressione ENTER para voltar ao menu Suporte...\n")
    leia(pausa)
    menuSuporte()
  }
funcao mostrarInfoDuvidas()
  {
    cadeia pausa

    escreva("\n===== TIRE SUAS DÚVIDAS =====\n\n")

    escreva("Se você está com dúvidas sobre documentos, saúde, trabalho, educação\n")
    escreva("ou qualquer outro direito como imigrante no Brasil, você pode buscar ajuda gratuita.\n\n")

    escreva("📌 Onde tirar dúvidas:\n")
    escreva("- CRAS (Centro de Referência da Assistência Social) mais próximo\n")
    escreva("- Defensoria Pública\n")
    escreva("- ONGs e associações de apoio ao imigrante\n")
    escreva("- Plataforma Porta Aberta Brasil (este sistema!)\n\n")

    escreva("💬 Atendimento presencial:\n")
    escreva("- Leve seus documentos, passaporte ou protocolo de refúgio\n")
    escreva("- Se tiver dificuldade com o idioma, tente levar um acompanhante que fale português\n\n")

    escreva("🌐 Atendimento online:\n")
    escreva("- Acesse: https://www.gov.br/mj/pt-br/assuntos/migracoes\n")
    escreva("- Ou procure por canais de WhatsApp das ONGs de apoio em Florianópolis\n\n")

    escreva("Dica: guarde sempre uma cópia dos seus documentos (digital e papel)\n")
    escreva("e anote seus dados importantes como CPF, número do protocolo e endereço atual.\n\n")

    escreva("Pressione ENTER para voltar ao menu Suporte...\n")
    leia(pausa)
    menuSuporte()
  }
funcao mostrarInfoForum()
  {
    cadeia pausa

    escreva("\n===== FÓRUM DE IMIGRANTES =====\n\n")

    escreva("Os fóruns de imigrantes são espaços seguros de troca de experiências,\n")
    escreva("apoio mútuo e construção coletiva de soluções para desafios comuns.\n\n")

    escreva("📱 Fóruns Online:\n")
    escreva("- Grupos de WhatsApp e Telegram organizados por ONGs e comunidades\n")
    escreva("- Plataformas como Facebook (ex: 'Imigrantes em Florianópolis')\n")
    escreva("- Canais no YouTube e perfis no Instagram com conteúdos informativos\n\n")

    escreva("📍 Fóruns Presenciais:\n")
    escreva("- Roda de Conversa entre Imigrantes (organizada por universidades e ONGs)\n")
    escreva("- Centros comunitários como o Círculo de Hospitalidade (bairro Itacorubi)\n")
    escreva("- Espaços culturais e eventos municipais sobre diversidade e migração\n\n")

    escreva("🎯 Importância:\n")
    escreva("- Compartilhar informações sobre documentos, moradia, saúde e trabalho\n")
    escreva("- Encontrar apoio emocional e construir novas amizades\n")
    escreva("- Participar de oficinas e debates sobre os seus direitos no Brasil\n\n")

    escreva("Acompanhe a agenda de eventos e fóruns pela plataforma Porta Aberta Brasil\n")
    escreva("ou consulte a ONG mais próxima para saber como participar.\n\n")

    escreva("Pressione ENTER para voltar ao menu Suporte...\n")
    leia(pausa)
    menuSuporte()
  }
funcao mostrarInfoEventos()
  {
    cadeia pausa

    escreva("\n===== EVENTOS E OFICINAS PARA IMIGRANTES =====\n\n")

    escreva("A cidade de Florianópolis oferece diversas atividades culturais e educativas\n")
    escreva("para apoiar a integração dos imigrantes na comunidade local.\n\n")

    escreva("🎉 Eventos Culturais:\n")
    escreva("- Festivais de cultura internacional\n")
    escreva("- Mostras de gastronomia típica\n")
    escreva("- Apresentações artísticas e musicais\n\n")

    escreva("📚 Oficinas e Cursos:\n")
    escreva("- Aulas de português para estrangeiros\n")
    escreva("- Capacitação profissional e cursos técnicos\n")
    escreva("- Oficinas de direitos e cidadania\n\n")

    escreva("🤝 Encontros Comunitários:\n")
    escreva("- Reuniões organizadas por ONGs e associações\n")
    escreva("- Grupos de apoio emocional e integração\n\n")

    escreva("📅 Para saber onde e quando:\n")
    escreva("- Acompanhe a agenda da Prefeitura de Florianópolis\n")
    escreva("- Consulte a plataforma Porta Aberta Brasil\n")
    escreva("- Verifique redes sociais de ONGs locais\n\n")

    escreva("Pressione ENTER para voltar ao menu Suporte...\n")
    leia(pausa)
    menuSuporte()
  }



//Função menu apps 
funcao mostrarInfoGovBr()
  {
    cadeia pausa

    escreva("\n===== GOV.BR =====\n\n")

    escreva("O Gov.br é a plataforma oficial do Governo Federal que reúne diversos serviços públicos\n")
    escreva("em um único lugar, facilitando o acesso do cidadão a informações e documentos digitais.\n\n")

    escreva("Principais funcionalidades:\n")
    escreva("- Acesso a documentos como CPF, CNH, Carteira de Trabalho Digital\n")
    escreva("- Agendamento de atendimentos em órgãos públicos\n")
    escreva("- Consulta de benefícios sociais, como Bolsa Família e Auxílio Emergencial\n")
    escreva("- Emissão de certidões e documentos oficiais\n\n")

    escreva("Como acessar:\n")
    escreva("- Pelo site: https://www.gov.br\n")
    escreva("- Pelo aplicativo para Android e iOS\n\n")

    escreva("Para usar, é necessário fazer cadastro com CPF e criar uma senha.\n")
    escreva("A plataforma é segura e integrada com vários órgãos públicos.\n\n")

    escreva("Pressione ENTER para voltar ao menu Aplicativos e Ferramentas...\n")
    leia(pausa)
    menuApps()
  }

funcao mostrarInfoMeuINSS()
  {
    cadeia pausa

    escreva("\n===== MEU INSS =====\n\n")

    escreva("O Meu INSS é o aplicativo oficial do Instituto Nacional do Seguro Social,\n")
    escreva("que permite aos usuários consultar e acompanhar benefícios previdenciários,\n")
    escreva("agendar atendimentos e solicitar serviços relacionados à aposentadoria, auxílios e pensões.\n\n")

    escreva("Principais funcionalidades:\n")
    escreva("- Consulta de extrato de contribuições\n")
    escreva("- Verificação de tempo de contribuição\n")
    escreva("- Agendamento de perícia médica e atendimento\n")
    escreva("- Solicitação de benefícios como auxílio-doença, aposentadoria e pensão por morte\n\n")

    escreva("Como acessar:\n")
    escreva("- Pelo site: https://meu.inss.gov.br\n")
    escreva("- Pelo aplicativo disponível para Android e iOS\n\n")

    escreva("É necessário ter CPF e cadastro no sistema para utilizar o app.\n\n")

    escreva("Pressione ENTER para voltar ao menu Aplicativos e Ferramentas...\n")
    leia(pausa)
    menuApps()
  }
funcao mostrarInfoCarteiraTrabalhoDigital()
  {
    cadeia pausa

    escreva("\n===== CARTEIRA DE TRABALHO DIGITAL =====\n\n")

    escreva("A Carteira de Trabalho Digital é uma versão eletrônica da carteira de trabalho física,\n")
    escreva("onde estão registrados os contratos de trabalho, salários e demais informações laborais.\n\n")

    escreva("Vantagens:\n")
    escreva("- Acesso fácil e rápido pelo celular ou computador\n")
    escreva("- Atualizações automáticas feitas pelo empregador\n")
    escreva("- Menos burocracia para consultar informações trabalhistas\n\n")

    escreva("Como acessar:\n")
    escreva("- Pelo site: https://servicos.mte.gov.br\n")
    escreva("- Pelo aplicativo disponível para Android e iOS\n\n")

    escreva("É necessário ter CPF e realizar cadastro no sistema para usar o serviço.\n\n")

    escreva("Pressione ENTER para voltar ao menu Aplicativos e Ferramentas...\n")
    leia(pausa)
    menuApps()
  }
funcao mostrarInfoAppsTransporte()
  {
    cadeia pausa

    escreva("\n===== APPS DE TRANSPORTE EM FLORIANÓPOLIS =====\n\n")

    escreva("1. Floripa Transporte\n")
    escreva("- Aplicativo oficial para consulta de horários, itinerários e linhas de ônibus na Grande Florianópolis.\n")
    escreva("- Disponível para Android e iOS.\n\n")

    escreva("2. Moovit\n")
    escreva("- App global para planejamento de rotas em transporte público, incluindo ônibus em Florianópolis.\n")
    escreva("- Mostra rotas, horários e alertas em tempo real.\n\n")

    escreva("3. Uber e 99\n")
    escreva("- Serviços de transporte por aplicativo que funcionam na cidade.\n")
    escreva("- Opções para deslocamento mais rápido e seguro.\n\n")

    escreva("4. SETUF\n")
    escreva("- Site e aplicativo oficial da empresa de transporte público de Florianópolis.\n")
    escreva("- Informações sobre linhas, bilhetes e terminais.\n\n")

    escreva("Dica: Para usar os apps de transporte público, tenha um chip com internet e familiarize-se com os trajetos.\n\n")

    escreva("Pressione ENTER para voltar ao menu Aplicativos e Ferramentas...\n")
    leia(pausa)
    menuApps()
  }


}
