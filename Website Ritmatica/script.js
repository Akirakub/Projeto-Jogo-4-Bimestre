document.addEventListener('DOMContentLoaded', () => { 
  // Comando pra esperar o documento HTML ser completamente carregado antes de executar o script
  // ENTRADA DE INFORMAÇÕES DOS MEMBROS NO PROGRAMA
  const membros = [  // Declaro um array contendo os objetos com as informações de cada membro da equipe
  //Aqui tem um bloco de colchetes para cada membro que eu coloco os nomes dos 4 tipos de variáveis (nome, cargo, github e avatar) e eles guardam as informações
    { 
      nome: "Bruno Lacerda", // Armazena o nome do membro 
      cargo: "Desenvolvedor WEB", //Armazena o cargo do membro
      github: "https://github.com/brunelaz", //Armazena o link do github do membro 
      avatar: "bruno.jpg" // Armazena a foto/avatar do membro 
      //Segue a mesma lógica para os outros blocos
    }, //Fecha o bloco do primeiro membro
    { //Abre o bloco do próximo membro, e assim segue até o final dos blocos 
      nome: "Fernando Akira", 
      cargo: "Programação e Gameplay", 
      github: "https://github.com/Akirakub",
      avatar: "fernando.jpg"
    },
    { 
      nome: "Eduardo Feitosa", 
      cargo: "Programação, Músicas, Sprites", 
      github: "https://github.com/3feitosa",
      avatar: "eduardo.jpg"
    },
    { 
      nome: "Arthur Muller", 
      cargo: "Documentação", 
      github: "https://github.com/Arthur7745",
      avatar: "arthurmuller.jpg" 
    },
    {
      nome: "Arthur Moreira", 
      cargo: "Documentação", 
      github: "https://github.com/ArthurMorSJ",
      avatar: "arthurmoreira.jpg" 
    }
    ];
  
  //BLOCO DE CRIAR OS BOTÕES E A TRILHA DO CARROSSEL
  const track = document.getElementById('carousel-track'); //Seleciona o elemento que os cards do carrossel serão colocados 
  //Aqui essa linha de código funciona da seguinte forma:
  // O const cria uma variável nova com o nome de "track" que é um nome comum para uma trilha de carrossel com um valor que será impossível alterar depois, o "const" cria uma variável que nunca mais pode ter outro valor depois que foi atribuido um valor para ela pela primeira vez
  // para atribuir um valor para essa variável, o "document" representa a página inteira HTML
  //O "getElementaById" captura um elemento específico no código HTML pelo ID dele, que no caso é 'carousel-track'

  const btnPrev = document.querySelector('.prev-btn'); //Cria uma variável com o nome de "btnPrev", que no caso o valor dela é o botão de voltar (anterior) do carrossel
  
  const btnNext = document.querySelector('.next-btn'); //Faz a mesma coisa que a linha acima, mas com o botão de avançar o carrossel

  if (!track || !btnPrev || !btnNext) return; //IF pra ver se os botões de avançar, voltar ou trilha não foram encontrados e interromper a execução do código JavaScript
  //A lógica dessa condicional funciona assim:
  // Aqui, o sinal de exclamação (!) significa "NÃO", então é assim: se o if não encontrar o track OU (||) não achou o btnPrev OU (||) não achou o btnNext, he executa o comando "return" que cancela o código inteiro

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

  let currentIndex = 4; // Cria uma variável que vai guardar o número da posição (índice) do card que está ativo (aparecendo no centro) no momento
  // Explicando parte por parte:
  // let: cria uma variável que pode ter seu valor alterado (diferente do const, porque o número da página atual vai mudar conforme o usuário clicar nos botões)
  // currentIndex: é o nome que demos para a variável que guarda o índice atual, começando no 4 (o último membro da lista)

  // BLOCO DA FUNÇÃO QUE ATUALIZA A APARÊNCIA DOS CARDS NO CARROSSEL
  function updateCarousel() { // Cria uma função chamada "updateCarousel" (atualizar carrossel) que vai organizar quem fica ativo, quem fica na esquerda e quem fica na direita
    cards.forEach((card, index) => { // Laço de repetição que passa por cada um dos cards salvos na lista
      card.classList.remove('active', 'prev', 'next'); // Tira todas as classes de posição antiga do card para evitar que fiquem duas classes ao mesmo tempo

      if (index === currentIndex) { // IF pra ver se o card da vez é exatamente o card da posição atual (central)
        card.classList.add('active'); // Se for, adiciona a classe CSS 'active' para ele ficar grande e no centro
      } else if (index === (currentIndex - 1 + cards.length) % cards.length) { // IF pra ver se o card da vez é o card anterior (que fica na esquerda)
        card.classList.add('prev'); // Se for adiciona a classe CSS 'prev' para ele ficar menor e do lado esquerdo
      } else if (index === (currentIndex + 1) % cards.length) { // IF pra ver se o card da vez é o próximo (que fica na direita)
        card.classList.add('next'); // Se for adiciona a classe CSS 'next' para ele ficar menor e do lado direito
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

  // CLIQUE NOS CARDS LATERAIS PARA NAVEGAR DIRETAMENTE
  cards.forEach((card) => { // Laço de repetição que passa por cada um dos cards do carrossel para adicionar o evento de clique neles
    card.addEventListener('click', (e) => { // Adiciona um "ouvinte" de clique em cada card; a letra (e) guarda as informações desse evento de clique
      if (card.classList.contains('prev')) { // IF pra ver se o card que foi clicado possui a classe CSS 'prev' (ou seja, se ele é o card que está na esquerda)
        e.preventDefault(); // Impede o comportamento padrão da tag <a> (que seria abrir o link do GitHub), fazendo com que o clique sirva apenas para navegar o carrossel
        prevCard(); // Chama a função que faz o carrossel voltar um card, trazendo o card da esquerda para o centro
      } else if (card.classList.contains('next')) { // IF pra ver se o card que foi clicado possui a classe CSS 'next' (ou seja, se ele é o card que está na direita)
        e.preventDefault(); // Também impede que o link do GitHub seja aberto ao clicar no card lateral direito
        nextCard(); // Chama a função que faz o carrossel avançar um card, trazendo o card da direita para o centro
      }
      // Se o card clicado não tiver nem 'prev' nem 'next' (ou seja, é o card 'active' do centro), o código não entra em nenhum IF e abre o link do GitHub normalmente
    });
  });

  updateCarousel(); // Executa a função de atualização uma vez logo no começo para alinhar os cards na posição inicial correta
});

// BLOCO DO MODAL DE AMPLIAÇÃO DE IMAGENS
document.addEventListener("DOMContentLoaded", () => { // Aguarda o documento HTML terminar de carregar antes de rodar o script do modal
  // Explicando parte por parte:
  // document: representa a página HTML inteira
  // addEventListener("DOMContentLoaded", ...): fica "escutando" o navegador até que toda a estrutura HTML esteja pronta para ser manipulada sem erros

  const modal = document.getElementById("modal-imagem"); // Cria a constante "modal" e captura a caixa/janela escura do modal pelo ID 'modal-imagem' no HTML
  const imgAmpliada = document.getElementById("img-ampliada"); // Cria a constante "imgAmpliada" e captura a tag <img> vazia dentro do modal pelo ID 'img-ampliada'
  const fechar = document.querySelector(".fechar-modal"); // Cria a constante "fechar" e seleciona o botão (geralmente um "X") com a classe CSS '.fechar-modal'
  const imagensExpandiveis = document.querySelectorAll(".img-expandivel"); // Busca todas as imagens da página que têm a classe '.img-expandivel' e guarda todas em uma lista

  // LAÇO PARA ADICIONAR O CLIQUE EM CADA IMAGEM EXPANDÍVEL
  imagensExpandiveis.forEach(img => { // Passa por cada uma das imagens encontradas na lista "imagensExpandiveis", chamando a imagem da vez de "img"
    img.addEventListener("click", () => { // Adiciona um evento que fica esperando o usuário clicar nessa imagem específica
      modal.style.display = "flex"; // Muda o estilo CSS 'display' do modal (que estava escondido como 'none') para 'flex', fazendo a janela aparecer na tela centralizada
      imgAmpliada.src = img.src; // Copia o caminho da foto (src) da imagem que foi clicada e cola dentro do src da imagem ampliada do modal
      modal.scrollTop = 0; // Garante que a barra de rolagem do modal volte para o topo (posição 0) toda vez que uma nova imagem for aberta

      if (img.classList.contains("img-codigo")) { // IF pra ver se a imagem clicada possui a classe CSS "img-codigo" (usada para prints de código muito altos/compridos)
        modal.classList.add("modal-rolavel"); // Se for uma imagem de código, adiciona a classe 'modal-rolavel' no modal para ativar a barra de rolagem vertical
      } else { // Caso contrário (se não for uma imagem de código)
        modal.classList.remove("modal-rolavel"); // Tira a classe 'modal-rolavel' para que imagens comuns fiquem ajustadas na tela sem rolagem extra
      }
    });
  });

  // BLOCO PARA FECHAR O MODAL PELO BOTÃO "X"
  if (fechar) { // IF pra ver se o botão de fechar (".fechar-modal") realmente existe na página HTML antes de tentar adicionar um evento nele
    fechar.addEventListener("click", () => { // Adiciona um evento de clique no botão de fechar
      modal.style.display = "none"; // Muda o display do modal de volta pra 'none', ai ele desaparece da tela
      modal.classList.remove("modal-rolavel"); // Tira a classe de rolagem para deixar o modal limpo para a próxima vez que for aberto
    });
  }

  // BLOCO PARA FECHAR O MODAL CLICANDO NO FUNDO ESCURO (FORA DA IMAGEM)
  if (modal) { // IF pra ver se o elemento do modal ("#modal-imagem") existe na página HTML
    modal.addEventListener("click", (e) => { // Adiciona um evento de clique no modal inteiro; o parâmetro (e) guarda exatamente onde o mouse clicou
      if (e.target === modal) { // IF pra ver se o alvo exato do clique (e.target) foi o fundo escuro do modal em si, e não a imagem ampliada que está dentro dele
        modal.style.display = "none"; // Se clicou fora da imagem, esconde o modal mudando o display para 'none'
        modal.classList.remove("modal-rolavel"); // Tira a classe de rolagem para resetar o estado do modal
      }
    });
  }
});