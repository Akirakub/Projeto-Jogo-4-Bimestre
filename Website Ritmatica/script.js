document.addEventListener('DOMContentLoaded', () => { 
  // Aguarda o documento HTML ser completamente carregado antes de executar o script
  // BLOCO DE ENTRADA DE INFORMAÇÕES DOS MEMBROS NO PROGRAMA
  const membros = [  // Declaro um array contendo os objetos com as informações de cada membro da equipe
  //Aqui tem um bloco de colchetes para cada membro que eu coloco os nomes dos 4 tipos de variáveis (nome, cargo, github e avatar) e eles armazenam, respectivamente, o nome do membro, o cargo do membro, o link dele no github e a foto dele
    { 
      nome: "Bruno Lacerda", // Armazena o nome do membro 
      cargo: "Desenvolvedor WEB e Programação", //Armazena o cargo do membro
      github: "https://github.com/brunelaz", //Armazena o link do github do membro 
      avatar: "https://suap.ifsp.edu.br/media/alunos/fotos/2026/Dcxv7Rm0i99oWJohazfln9r4tiJwroXHx6NhnP1sZ18.jpg" // Armazena a foto/avatar do membro 
      //Segue a mesma lógica para os próximos blocos
    }, //Fecha o bloco do primeiro membro
    { //Abre o bloco do próximo membro, e assim segue até o final dos blocos 
      nome: "Fernando Akira", 
      cargo: "Programador Principal e Gameplay", 
      github: "https://github.com/Akirakub",
      avatar: "https://suap.ifsp.edu.br/media/alunos/fotos/2026/smfprrTx_vptIbrIdOaIyufX5LpsuOVy0JWmSfTwey8.jpg"
    },
    { 
      nome: "Eduardo Feitosa", 
      cargo: "Músicas, Sprites e Programação", 
      github: "https://github.com/3feitosa",
      avatar: "https://suap.ifsp.edu.br/media/alunos/fotos/2026/qP8gIkDfrE4gCHvlOqnTbHjqo_77Le6gkuUgrz-nm4I.jpg"
    },
    { 
      nome: "Arthur Muller", 
      cargo: "Documentação", 
      github: "https://github.com",
      avatar: "https://suap.ifsp.edu.br/media/alunos/fotos/2026/XdhYPV-6j8H5pnCSkie5rbQLactYjBY4c8cYOM4fZvI.jpg" 
    },
    {
      nome: "Arthur Moreira", 
      cargo: "Documentação", 
      github: "https://github.com/ArthurMorSJ",
      avatar: "https://suap.ifsp.edu.br/media/alunos/fotos/2026/nqvxLfFfxLJ673TMx44S70h-4lxBMOAXe2mIaVkoiS0.jpg" 
    }
    ];
  
  //BLOCO DE CRIAR OS BOTÕES E A TRILHA DO CARROSSEL
  const track = document.getElementById('carousel-track'); //Seleciona o elemento (container) em que os cards do carrossel serão colocados 
  //Aqui essa linha de código funciona da seguinte forma:
  // O const cria uma variável nova com o nome de "track" que é um nome comum para uma trilha de carrossel com um valor que será impossível alterar depois, o "const" cria uma variável que nunca mais pode ter outro valor depois que foi atribuido um valor para ela pela primeira vez
  // para atribuir um valor para essa variável, o "document" representa a página inteira HTML
  //O "getElementaById" captura um elemento específico no código HTML pelo ID dele, que no caso é 'carousel-track'

  const btnPrev = document.querySelector('.prev-btn'); //Cria uma variável com o nome de "btnPrev", que no caso o valor dela é o botão de voltar (anterior) do carrossel
  
  const btnNext = document.querySelector('.next-btn'); //Faz a mesma coisa que a linha acima, mas com o botão de avançar o carrossel

  if (!track || !btnPrev || !btnNext) return; //A função dessa linha é interromper a execução do código JavaScript se os botões de avançar, voltar ou trilha não forem encontrados
  //A lógica dessa condicional funciona assim:
  // Aqui, o sinal de exclamação (!) significa "NÃO", então é assim: se o if não encontrar o track OU (||) não achou o btnPrev OU (||) não achou o btnNext, ele executa o comando "return" que cancela o código inteiro

  //BLOCO DE CRIAÇÃO DE CARDS
  // Otimização de Performance: Utilização de DocumentFragment para inserir todos os cards de uma só vez, evitando reflows excessivos no navegador
  const fragment = document.createDocumentFragment();

  membros.forEach((membro, index) => { //Essa linha começa um laço de repetição, que passa por cada um dos itens de dentro do array "membros", que é o que criamos no começo
  //Explicando a linha parte por parte
  //membros: indica o vetor "membros em que eu guardei todas as informações dos membros no começo do código"
  //forEach: É uma função do JavaScript que significa "para cada item" então ela pega a lista e executa um código de bloco para cada elemento dentro dela, de forma automática
  //(membro, index) => {: É uma função de seta que diz o que deve ser feito com cada item da lista. Dentro dos parênteses (membro, index) ela recebe dois valores que o JavaScript entrega de presente a cada volta do loop.
  //membro: É o objeto da pessoa da vez (na primeira volta é o Bruno, na segunda é o Fernando, etc.)
  //index: É o número da posição daquele item no vetor, começando sempre do 0 (exemplo: Bruno é 0, Fernando é 1, Eduardo é 2, etc.)
    
    const card = document.createElement('a');    // Essa linha cria um elemento HTML novo do zero direto pelo Javascript, sem que ele esteja escrito diretamente no arquivo HTML
    //Explicando parte por parte:
    // const card: cria uma variável constante (com um valor que não pode ser mudado) com o nome "card"
    // document: representa a página HTML inteira
    // createElement('a'): É uma função que diz: crie uma nova tag HTMl do tipo <a>
    
    card.classList.add('carousel-card'); //Adiciona a classe do arquivo CSS chamada 'carousel-card' para o elemento criado na linha anterior
  //Explicando parte por parte
  //card: se refere a variável "card" que foi criado na linha anterior
  //classList.add: Ele faz com que a tag CSS entre parenteses a seguir seja atribuida para a constante card
  //('carousel-card'): Mostra a tag CSS que deve ser atriubida à variável card, no caso é a 'carousel-card' 

    card.dataset.index = index; // Adiciona um atributo de dados (data-index) com a posição atual do membro no array
    //Explicando parte por parte
    //card: se refere a variável "card" que foi criada 
    //.dataset: É uma forma especial do JavaScript para mexer com atributos de dados de um elemento HTML, aqueles que começam com data-* (como data-index, data-id, etc.).
    //index: é o nome específico do atributo que está sendo criado, em HTMl, isso vai se transformar em data-index
    //Atribui o valor da posição numerica do item no loop

    card.href = membro.github;  // Define o link de destino do card como o perfil do GitHub do membro
    //Explicando parte por parte:
    //card: Se refere a variáve constante "card" em que criamos
    //.href: Mostra para o Javascript que é um link em que um elemento redirecionará para um link 
    // membro.github: Ele pega as informações que entraram no programa no começo do código, onde ele acessa "membro" que é um vetor que guarda informações de todos os membros e .github, que foi uma tag atribuida para o link do github de cada membro
    
    card.target = "_blank";  // Configura o link para abrir em uma nova aba/janela
    //Explicando parte por parte:
    // card: Se refere a variável constante "card" que foi declarada
    // .target significa que eu vou atribuir um parâmetro para a variável
    // = "_blank": É a tag que faz o link redirecionado abrir em uma nova guia
    
    card.rel = "noopener noreferrer";      // Adiciona medida de segurança recomendada para links que usam target="_blank"
    //Explicando parte por parte: 
    //card: se refere a variável constante "card" que foi declarada
    //.rel: É a propriedade do elemento HTMl que define a relação (rel) entre a página atual e o link de destino
    // = "noopener noreferrer": São dois parâmetros muito importantes de segurança quando usamos o target="_blank"
    // noopeneer: Impede que a página que abriu (o carrossel) seja controlada ou modificada maliciosamente pela página de destino (o Github do membro)
    // noreferrer: Esconde o cabeçalho de referência, ou seja, o site de destino não sabe de qual página o usuário veio, aumentando a privacidade
    
    card.innerHTML = `
      <img src="${membro.avatar}" alt="Avatar de ${membro.nome}" class="carousel-avatar" loading="lazy"> 
      <div class="carousel-content">
        <h3>${membro.nome}</h3>
        <p>${membro.cargo}</p>
      </div>
    `;
    // Define o conteúdo HTML interno do card pelo template 
    // Explicando parte por parte:
    // card: é a variável constante "card" que criamos e estamos preenchendo
    // .innerHTML: é a propriedade que altera ou insere o código HTML dentro* do elemento
    // `` (crases): serve pra escrever textos em várias linhas e usar o ${...} para colocar variáveis no meio do texto
    // ${membro.avatar}: pega a foto do objeto atual do loop e a insere dentro da tag <img>
    // ${membro.nome}: pega o nome do objeto atual do loop e o insere dentro da tag <h3>
    // ${membro.cargo}: pega o cargo do objeto atual do loop e o insere dentro da tag <p>

    fragment.appendChild(card);  // Adiciona o card de forma temporária para o fragmento para deixar mais eficiente a renderização em lote
  });

  track.appendChild(fragment); // Adiciona todos os cards de uma vez dentro da trilha do carrossel na página
  // Explicando parte por parte:
  // track: se refere à constante "track" (a trilha do carrossel que selecionamos lá no começo do código)
  // .appendChild(): é a função que pega um elemento que estava apenas na "memória" e o insere fisicamente como filho de outro elemento na página HTML 
  // (card): é o elemento que acabamos de criar, configurar, estilizar e preencher, e que agora vai aparecer de verdade na tela para o usuário

  //FUNCIONAMENTO DO CARROSSEL
  const cards = track.querySelectorAll('.carousel-card'); // Seleciona todos os cards que foram criados e colocados dentro da trilha do carrossel
  // Explicando parte por parte:
  // track: pega a trilha do carrossel onde os cards estão salvos
  // querySelectorAll('.carousel-card'): busca todos os elementos HTML que possuem a classe CSS 'carousel-card' e guarda todos eles em forma de lista dentro da constante "cards"

  let currentIndex = 0; // Cria uma variável que vai guardar o número da posição (índice) do card que está ativo (aparecendo no centro) no momento
  // Explicando parte por parte:
  // let: cria uma variável que pode ter seu valor alterado (diferente do const, porque o número da página atual vai mudar conforme o usuário clicar nos botões)
  // currentIndex: é o nome que demos para a variável que guarda o índice atual, começando no 0 (o primeiro membro da lista)

  // BLOCO DA FUNÇÃO QUE ATUALIZA A APARÊNCIA DOS CARDS NO CARROSSEL
  function updateCarousel() { // Cria uma função chamada "updateCarousel" (atualizar carrossel) que vai organizar quem fica ativo, quem fica na esquerda e quem fica na direita
    cards.forEach((card, index) => { // Laço de repetição que passa por cada um dos cards salvos na lista
      card.classList.remove('active', 'prev', 'next'); // Remove todas as classes de posição antiga do card para evitar que fiquem duas classes ao mesmo tempo

      if (index === currentIndex) { // Verifica se o card da vez é exatamente o card da posição atual (central)
        card.classList.add('active'); // Se for, adiciona a classe CSS 'active' para ele ficar grande e no centro
      } else if (index === (currentIndex - 1 + cards.length) % cards.length) { // Verifica se o card da vez é o card anterior (que fica na esquerda)
        card.classList.add('prev'); // Se for, adiciona a classe CSS 'prev' para ele ficar menor e do lado esquerdo
      } else if (index === (currentIndex + 1) % cards.length) { // Verifica se o card da vez é o próximo (que fica na direita)
        card.classList.add('next'); // Se for, adiciona a classe CSS 'next' para ele ficar menor e do lado direito
      }
    });
  }

  // BLOCO DA FUNÇÃO PARA AVANÇAR O CARROSSEL
  function nextCard() { // Cria a função "nextCard"  que serve pra passar para o próximo card quando apertar o botão de avançar
    currentIndex = (currentIndex + 1) % cards.length; // Soma 1 ao número da posição atual. O operador % faz dar a volta e voltar para o zero se chegar no final da lista
    updateCarousel(); // Chama a função que atualiza a tela pra mostrar o novo card ativo
  }

  // BLOCO DA FUNÇÃO PARA VOLTAR O CARROSSEL
  function prevCard() { // Cria uma função chamada "prevCard" pra voltar pro card anterior quando apertar o botão de voltar
    currentIndex = (currentIndex - 1 + cards.length) % cards.length; // Subtrai 1 do número da posição atual. Se estiver no zero, ele dá a volta e vai para o último card da lista
    updateCarousel(); // Chama a função que atualiza a tela para mostrar o card anterior ativo
  }

  // BLOCO DE EVENTOS DE CLIQUE DOS BOTÕES DE NAVEGAÇÃO
  btnNext.addEventListener('click', nextCard); // Adiciona uma função que recebe o clique no botão de avançar (seta para a direita). Quando o usuário clica, ele roda a função "nextCard"
  btnPrev.addEventListener('click', prevCard); // Adiciona uma função que recebe o clique no botão de voltar (seta para a esquerda). Quando o usuário clica, ele roda a função "prevCard"

  // BLOCO DE CLIQUE NOS CARDS LATERAIS
  cards.forEach((card) => { // Passa por cada card individualmente para verificar cliques neles
    card.addEventListener('click', (e) => { // Adiciona um código para perceber o clique no card
      if (card.classList.contains('prev')) { // Verifica se o usuário clicou no card que está do lado esquerdo (classe 'prev')
        e.preventDefault(); // Impede que o link abra imediatamente para que o usuário possa primeiro trazer o card para o centro
        prevCard(); // Roda a função de voltar para centralizar esse card
      } else if (card.classList.contains('next')) { // Verifica se o usuário clicou no card que está do lado direito (classe 'next')
        e.preventDefault(); // Impede que o link abra imediatamente
        nextCard(); // Roda a função de avançar para centralizar esse card
      }
    });
  });

  // BLOCO DE INICIALIZAÇÃO
  updateCarousel(); // Executa a função de atualizar o carrossel logo na primeira vez que a página abre, para deixar o primeiro card centralizado certinho
});