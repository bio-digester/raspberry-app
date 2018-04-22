function drawLine(ctx, startX, startY, endX, endY){
    ctx.beginPath();
    ctx.moveTo(startX,startY);
    ctx.lineTo(endX,endY);
    ctx.stroke();
};

function drawArc(ctx, centerX, centerY, radius, startAngle, endAngle){
    ctx.beginPath();
    ctx.arc(centerX, centerY, radius, startAngle, endAngle);
    ctx.stroke();
};

function drawPieSlice(ctx,centerX, centerY, radius, startAngle, endAngle, color ){
    ctx.fillStyle = color;
    ctx.beginPath();
    ctx.moveTo(centerX,centerY);
    ctx.arc(centerX, centerY, radius, startAngle, endAngle);
    ctx.closePath();
    ctx.fill();
};

function desenhaGraficoBarras(context,valoresColuna, arrayCores, espacado=false){
    ctx = context;

    desenhaEixosXY();

    var valorEspacamento = null;
    var espacamentoTotal = null;


    var quantidadeBarras = valoresColuna.length;
    var widthColuna = null;
    var heightColuna = null;

    if(espacado == true){
        valorEspacamento = 20;
        espacamentoTotal = quantidadeBarras * valorEspacamento;
        widthColuna = (widthGrafico - espacamentoTotal) / quantidadeBarras;
    }else{
        valorEspacamento = 0;
        espacamentoTotal = 0;
        widthColuna = widthGrafico / quantidadeBarras;;
    }

    var x = inicioGraficoX + valorEspacamento / 2 ;
    var y = inicioGraficoY + heightGrafico - valoresColuna[0];

    for(i = 0 ; i < quantidadeBarras ; i++){

        drawLine(ctx, x + widthColuna/2, inicioGraficoY + heightGrafico, x + widthColuna / 2 , inicioGraficoY +heightGrafico - 2); // desenha tracos no eixo x

        heightColuna = valoresColuna[i];
     
        color = arrayCores[i];
        desenhaBarras(x, y, widthColuna, heightColuna, color);
        

        x = x + widthColuna + valorEspacamento;
        y = inicioGraficoY + heightGrafico - valoresColuna[i + 1];
    }   
}

function desenhaEixosXY(){
    // este bloco de 3 linhas desenha o eixo x e o eixo y
    ctx.fillStyle="#000000";
    drawLine(ctx, inicioGraficoX, heightGrafico + inicioGraficoY, widthGrafico + inicioGraficoX, heightGrafico + inicioGraficoY);
    drawLine(ctx, inicioGraficoX, inicioGraficoY, inicioGraficoX, heightGrafico + inicioGraficoY);

}


function desenhaBarras(x, y, width , height, color){
    ctx.fillStyle=color;
    ctx.fillRect( x , y , width, height);

}

function escreveValoresBarra(menorValor, fim ){
    var mensagem = valor; //Define a mensagem
    ctx.font = '9pt Arial'; //Define Tamanho e fonte
    ctx.fillStyle = 'black'; //Define a cor
    ctx.fillText(mensagem, positionX, positionY); //Desenha a mensagem
}

function formata(arrayCoresDesformatado){
    var arrayCores = arrayCoresDesformatado.split(",");
    return arrayCores;
}



