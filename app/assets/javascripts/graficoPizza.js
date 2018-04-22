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

function desenhaGraficoBarras(valoresColuna, arrayCores){

    desenhaEixosXY();


    var quantidadeBarras = valoresColuna.length;
    var widthColuna = widthGrafico / quantidadeBarras;
    var x = inicioGraficoX;
    var y = heightGrafico - valoresColuna[0];
    var heightColuna = null;

    for(i = 0 ; i < quantidadeBarras ; i++){

        drawLine(ctx, x + widthColuna/2, heightGrafico, x + widthColuna / 2 , heightGrafico - 2); // desenha tracos no eixo x
    
        heightColuna = valoresColuna[i];
     
        color = arrayCores[i];
        desenhaBarras(x, y, widthColuna, heightColuna, color);
        x = x + widthColuna;
        y = heightGrafico - valoresColuna[i + 1];
    }
}

function desenhaEixosXY(){
    // este bloco de 3 linhas desenha o eixo x e o eixo y
    ctx.fillStyle="#000000";
    drawLine(ctx, inicioGraficoX, heightGrafico, widthGrafico, heightGrafico);
    drawLine(ctx, inicioGraficoX, inicioGraficoY, inicioGraficoX, heightGrafico);

}


function desenhaBarras(x, y, width , height, color){
    ctx.fillStyle=color;
    ctx.fillRect( x , y , width, height);
}



