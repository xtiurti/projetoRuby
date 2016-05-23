Divisão de Tarefas

    Cobertura de testes (3 pontos);
    Usabilidade (2 pontos);
    Cumprimento dos requisitos (4 pontos);
    Uso sensato de uma ferramenta de versionamento (1 ponto)
    i18n (bonus 1 ponto)
    Uso de tecnologias abordadas fora da sala (bônus 2 pontos)
    O projeto deverá ser entregue até: <data> compactado, com versionamento
    A avaliação será uma apresentação como na prova, e com duração máxima de 1 aula;
    O desenvolvimento poderá ser individual ou em duplas, porém caso seja em duplas, a avaliação do uso da ferramenta de versionamento será mais rigorosa, e também deverá constar ambos os acadêmicos no versionamento. Utilização obrigatória de um git hosted.

Princípio do sistema:

    O sistema é "single-user", ou seja, não há distinção de dados entre usuários;
    O sistema deverá permitir o cadastro de informações para gerar relatórios chamado de "plano de ensino";

Descrição de requisitos minimos(funcionamento):

    Seguir todo o modelo para criar os cadastros do sistema;
    Ser possível gerar diferentes planos de ensinos de diferentes disciplinas, para diferentes turmas, para múltiplas instituições;
    Para cada disciplina deverá ser cadastrado um professor responsável;
    Cada disciplina possuirá conteúdos programáticos, com ordem de item, ementa, e conteúdo programático;
    Essa disciplica possuirá uma carga horária numérica(uma contagem), para diferentes categorias(AT, AP, APS, AD, APCC), e deverá ser designado em quais dias da semana a disciplina será aplicada, e o número de aulas para cada dia.
    Com base na informação de dias da semana e número de aulas, deverá ser possível distribuir em um calendário essa relação de dias;
    Possibilidade de cadastrar também informações de dias excepcionais, onde não será possível distribuir aula nesse dia, ou então o conteúdo da aula será forçado para um evento.
    Com base no número de tópicos da ementa, deverá informar ao usuário inconsistências, como:
        Aulas faltantes conforme a carga horária (Ie.: Cadastrou 75 aulas, e na ementa são 77)
        Tópicos faltantes para as aulas (As aulas foram relacionadas até o tópico 4 da ementa, mas ainda falta o tópico 5)
