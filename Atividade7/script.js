function jogarPedra(){
    document.getElementById("player-hand").src="images/fist.png";
    let jogada = 1;
    document.getElementById("voceEscolheu").innerText="Você escolheu... pedra";
    jogarComRobo(jogada);
}

function jogarPapel(){
    document.getElementById("player-hand").src="images/hand.png";
    let jogada = 2;
    document.getElementById("voceEscolheu").innerText="Você escolheu... papel";
    jogarComRobo(jogada);
}

function jogarTesoura(){
    document.getElementById("player-hand").src="images/v.png";
    document.getElementById("voceEscolheu").innerText="Você escolheu... tesoura";
    let jogada = 3;
    jogarComRobo(jogada);
}

function jogarComRobo(jogada){
    let aleatorio = parseInt(Math.random() * 3) + 1;
    if(aleatorio == 1){
        document.getElementById("robot-hand").src="images/fist.png";
        document.getElementById("roboEscolheu").innerText="O robô escolheu... pedra";
        if(jogada == 1){
            document.getElementById("resultado").innerText="Empate.";
        }
        if(jogada == 2){
            document.getElementById("resultado").innerText="Vitória.";
        }
        if(jogada == 3){
            document.getElementById("resultado").innerText="Derrota.";
        }

    }
    if(aleatorio == 2){
        document.getElementById("robot-hand").src="images/hand.png";
        document.getElementById("roboEscolheu").innerText="O robô escolheu... papel";
        if(jogada == 1){
            document.getElementById("resultado").innerText="Derrota.";
        }
        if(jogada == 2){
            document.getElementById("resultado").innerText="Empate.";
        }
        if(jogada == 3){
            document.getElementById("resultado").innerText="Vitória.";
        }
    }
    if(aleatorio == 3){
        document.getElementById("robot-hand").src="images/v.png";
        document.getElementById("roboEscolheu").innerText="O robô escolheu... tesoura";
        if(jogada == 1){
            document.getElementById("resultado").innerText="Vitória.";
        }
        if(jogada == 2){
            document.getElementById("resultado").innerText="Derrota.";
        }
        if(jogada == 3){
            document.getElementById("resultado").innerText="Empate.";
        }
    }
    else{

    }
}