function imagineModificata = eliminaObiect(img,metodaSelectareDrum,ploteazaDrum,culoareDrum)

    figure, imshow(img)
    rect = getrect;
        
    xmin = int64(rect(1));
    xmax = int64(rect(1) + rect(3));
    ymin = int64(rect(2));
    ymax = int64(rect(2) + rect(4));
        
    if(rect(3)>rect(4))
        %micsoreazaInaltime...
        aux = xmin;
        xmin = size(img,1) - ymin - rect(4);
        ymin = aux;
        aux = xmax;
        xmax = ymax;
        ymax = aux;
        img=imrotate(img,-90);
                        
               
        for i=1:rect(4) 
            disp(['Eliminam drumul vertical numarul ' num2str(i) ...
                ' dintr-un total de ' num2str(rect(4))]);
            
            E = calculeazaEnergie(img);
            E(ymin:ymax,xmin:xmax) = -1000;   
                
            drum = selecteazaDrumVertical(E,metodaSelectareDrum);
                
            xmax = xmax - 1;
                               
            if ploteazaDrum
                ploteazaDrumVertical(img,E,drum,culoareDrum);
                pause(1);
                close(gcf);
            end
                
            img = eliminaDrumVertical(img, drum);
        end
    img=imrotate(img,90);
    imagineModificata = img;
    
    else
        %micsoreazaLatime..
        for i=1:rect(3)        
            disp(['Eliminam drumul vertical numarul ' num2str(i) ...
                ' dintr-un total de ' num2str(rect(4))]);
            
            E = calculeazaEnergie(img);
            E(ymin:ymax,xmin:xmax) = -1000;
            
            drum = selecteazaDrumVertical(E,metodaSelectareDrum);
            
            xmax = xmax-1;
                
            if ploteazaDrum
                ploteazaDrumVertical(img,E,drum,culoareDrum);
                pause(1);
                close(gcf);
            end
                
            img = eliminaDrumVertical(img, drum);          
        end;
            imagineModificata = img;
    end  
                                 
end                                 

