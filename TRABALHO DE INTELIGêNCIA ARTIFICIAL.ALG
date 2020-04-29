 algoritmo "Trabalho de Inteligência Artificial"
// Função : Jogo Puzzle 8
// Autor : Bruno dos Santos Silva
// Data : 15/03/2020
var
  vet     : vetor[1..25    ]    de inteiro
  taborig : vetor[1..5,1..5]    de inteiro
  tabrand : vetor[1..5,1..5]    de inteiro
  contmov,tam,aux,aux2,i,j,l,c   : inteiro
  linha,coluna,tabuleiro,cont    : inteiro
  contres,opcao,ii,xix,num,lf,cf : inteiro
procedimento imprime_tabuleiro
inicio
escreval("-----------------------------------------------------")
    escreval("Faça o movimento do ",num," até igualar a tabela padrão")
    escreval()
    para l de 1 ate tam faca
      para c de 1 ate tam faca
        escreva(tabrand[l,c])
        Se (tabuleiro = 3) entao
          escreva("  ")
        fimse
      fimpara
      Se (tabuleiro = 3) entao
        escreva("  ")
      senao
        escreval()
      fimse
    fimpara
    escreval("-----------------------------------------------------")
fimprocedimento
inicio
  //Escolha do tabuleiro
  repita
    Escreval("Escolha o modo de jogo:")
    Escreval("(1) Fácil"              )
    Escreval("(2) Normall"            )
    Escreval("(3) Difícil"            )
    Leia(tabuleiro)
  ate((tabuleiro = 1) ou (tabuleiro = 2) ou (tabuleiro = 3))
  Limpatela
  tam := tabuleiro+2
  lf  := tam
  cf  := lf
  //Tabela padrão
  Escreval("Como a tabela deve ficar")
  Escreval()
  cont <- 1
  para linha de 1 ate tam faca
    para coluna de 1 ate tam faca
      taborig[linha,coluna]<- cont
      cont <- cont + 1
    fimpara
  fimpara
  taborig[tam,tam] <- 0
  para linha de 1 ate tam faca
    para coluna de 1 ate tam faca
      escreva(taborig[linha,coluna]," ")
    fimpara
    escreval()
  fimpara
  escreval()
  //Tabela aleatória
  //Tabuleiro 3x3
  Se tabuleiro = 1 entao
    para i de 1 ate 9 faca
      vet[i] <- Randi(9)
      se i > 1 entao
        j <- 1
        enquanto j < i faca
          se vet[i] = vet[j] entao
            vet[i] <- randi(9)
            j <- 1
          senao
            j <- j+1
          fimse
        fimenquanto
      fimse
      ii <- 0
      para l de 1 ate 3 faca
        para c de 1 ate 3 faca
          tabrand[l,c] <- vet[1+ii]
          ii<- ii + 1
        fimpara
      fimpara
    fimpara
  fimse
  //tabuleiro 4x4
  Se tabuleiro = 2 entao
    tam <- 4
    para i de 1 ate 16 faca
      vet <- Randi 16
      se i -> 1 entao
        j <- 1
        enquanto j < i faca
          se vet = vet[j] entao
            vet <- randi(16)
            j <- 1
          senao
            j <- j+1
          fimse
        fimenquanto
      fimse
      ii <- 0
      para l de 1 ate 4 faca
        para c de 1 ate 4 faca
          tabrand[l,c] <- vet[1+ii]
          ii<- ii + 1
        fimpara
      fimpara
    fimpara
  fimse
  //tabuleiro 5x5
  Se (tabuleiro = 3) entao
    tam <- 5
    para i de 1 ate 25 faca
      vet <- Randi 25
      se i > 1 entao
        j <- 1
        enquanto j < i faca
          se vet = vet[j] entao
            vet <- randi 25
            j <- 1
          senao
            j <- j+1
          fimse
        fimenquanto
      fimse
      ii <- 0
      para l de 1 ate 5 faca
        para c de 1 ate 5 faca
          tabrand[l,c] <- vet[1+ii]
          ii<- ii + 1
        fimpara
      fimpara
    fimpara
  fimse
  //escolha dos movimentos
  contmov <- 0
  //O PROBLEMA ESTÀ NESSE REPITA  e no ATE LÁ NO FINAL
  repita
    Repita
      imprime_tabuleiro   // imprimie o tabuleiro
      escreval("Faça os movimentos com as teclas")
      escreval("  8  ")
      escreval("4 * 6")
      escreval("  2  ")
      escreval()
      repita
        leia (opcao)
        escreval()
      ate ((opcao = 4) ou (opcao = 6) ou (opcao = 2) ou (opcao = 8))
      escolha opcao
      //Movimento esquerda
      caso 4
        para l de 1 ate tam faca
          para c de 1 ate tam faca
            se tabrand[l,c] = num entao   // era zero 0
              se c<>1 entao
                aux            <- tabrand[l,c]
                tabrand[l,c]   <- tabrand[l,c-1]
                tabrand[l,c-1] <- aux
              fimse
            fimse
          fimpara
        fimpara
        contmov <- contmov + 1
        para l de 1 ate tam faca
          para c de 1 ate tam faca
            escreva(tabrand[l,c])
          fimpara
          escreval()
        fimpara
        //Movimento para cima
      caso 8
        para l de 1 ate tam faca
          para c de 1 ate tam faca
            se (l<>1) ENTAO
              se tabrand[l,c] = num entao  // era zero 0
                aux <- tabrand[l,c]
                tabrand[l,c] <- tabrand[l-1,c]
                tabrand[l-1,c] <- aux
              fimse
            fimse
          fimpara
        fimpara
        contmov <- contmov + 1
        para l de 1 ate tam faca
          para c de 1 ate tam faca
            escreva(tabrand[l,c])
          fimpara
          escreval()
        fimpara
        //Movimento para direita
      caso 6
        para l de 1 ate 3 faca
          para c de 1 ate 3 faca
            se (c<>tam) ENTAO
              se tabrand[l,c] = num entao   // era zero 0
                aux <- tabrand[l,c]
                tabrand[l,c] <- tabrand[l,c+1]
                tabrand[l,c+1] <- aux
                interrompa
              fimse
            fimse
          fimpara
        fimpara
        contmov <- contmov + 1
        para l de 1 ate tam faca
          para c de 1 ate tam faca
            escreva(tabrand[l,c])
          fimpara
          escreval()
        fimpara
        //movimento para baixo
      caso 2
        para l de 1 ate tam faca
          aux2 <- 1
          para c de 1 ate tam faca
            se (l<>tam) entao
              se tabrand[l,c] = num entao   // era zero 0
                aux <- tabrand[l,c]
                tabrand[l,c] <- tabrand[l+1,c]
                tabrand[l+1,c] <- aux
                aux2 <- aux
                interrompa
              fimse
            fimse
          fimpara
          se(l<>tam) entao
            se (aux2 = num) entao  // era zero 0
              interrompa
            fimse
          fimse
        fimpara
        contmov <- contmov + 1
      fimescolha
    ate tabrand[lf,cf] = num  // num é o qual número que vai mover
    se(tabuleiro = 1) entao
      se num = 0 entao        //posiciona em qual linha e coluna está o número
        cf := 0               // é a coluna onde ficará o número que está movendo
      fimse
      se num < 3 entao
        lf:=1                // é a linha onde ficará o número que está movendo
        cf := cf + 1         // é a coluna onde ficará o número que está movendo
      senao
        se num < 6 entao
          se num = 3 entao
            cf := 0          // é a coluna onde ficará o número que está movendo
          fimse
          lf := 2            // é a linha onde ficará o número que está movendo
          cf := cf + 1       // é a coluna onde ficará o número que está movendo
        senao
          se num = 6 entao
            cf := 0          // é a coluna onde ficará o número que está movendo
          fimse
          lf := 3            // é a linha onde ficará o número que está movendo
          cf := cf + 1       // é a coluna onde ficará o número que está movendo
        fimse
      fimse
    senao
      //construir para tabuleiro = 2 e 3
    fimse
    num := num + 1
    limpatela
    se num < 9 entao
      escreval("========================================")
      escreval("    Agora Será A Vez Do Número ---> ",num)
      escreval("========================================")
    fimse
  ate num = 9  // ate mover todos os números
  escreval("   +------------------------------------------+")
  escreval("   |        Completou Os Movimentos           |")
  para l de 1 ate tam faca
    escreva("   |               ")
    para c de 1 ate tam faca
      escreva(tabrand[l,c])
    fimpara
    escreva("                     |")
    escreval
  fimpara
  escreval("   |                                          |")
  escreval("   +------------------------------------------+")
  escreval
  Escreval("           Parabéns!!! Você Venceu!!!")
  escreval("                                      ----")
  escreval("           Número de tentativas foi : ",contmov," ")
  escreval("                                      ----")
  escreval
fimalgoritmo