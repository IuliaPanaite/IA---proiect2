function img = maresteLatime(img,numarPixeliLatime,metodaSelectareDrum,ploteazaDrum,culoareDrum)
%micsoreaza imaginea cu un numar de pixeli 'numarPixeliLatime' pe latime (elimina drumuri de sus in jos) 
%
%input: img - imaginea initiala
%       numarPixeliLatime - specifica numarul de drumuri de sus in jos eliminate
%       metodaSelectareDrum - specifica metoda aleasa pentru selectarea drumului. Valori posibile:
%                           'aleator' - alege un drum aleator
%                           'greedy' - alege un drum utilizand metoda Greedy
%                           'programareDinamica' - alege un drum folosind metoda Programarii Dinamice
%       ploteazaDrum - specifica daca se ploteaza drumul gasit la fiecare pas. Valori posibile:
%                    0 - nu se ploteaza
%                    1 - se ploteaza
%       culoareDrum  - specifica culoarea cu care se vor plota pixelii din drum. Valori posibile:
%                    [r g b]' - triplete RGB (e.g [255 0 0]' - rosu)          
%                           
% output: img - imaginea redimensionata obtinuta prin eliminarea drumurilor
matDr = [];
imgCopy = img;
for i = 1:numarPixeliLatime
    
    disp(['Eliminam drumul vertical numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliLatime)]);
    
    %calculeaza energia dupa ecuatia (1) din articol
    E = calculeazaEnergie(img);
    
    %alege drumul vertical care conecteaza sus de jos
    drum = selecteazaDrumVertical(E,metodaSelectareDrum);
    
%     %afiseaza drum
%     if ploteazaDrum
%         ploteazaDrumVertical(img,E,drum,culoareDrum);
% %         pause(1);
%         close(gcf);
%     end
    matDr = [matDr drum(:,2)];
    
    %elimina drumul din imagine
    img = eliminaDrumVertical(img,drum);

end

for idx = 1 : size(matDr,2)
    disp(['Adauga drumul vertical numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliLatime)]);
    drum = [[1:size(matDr,1)]' matDr(:,idx)];
    imgCopy = adaugaDrumVertical(imgCopy,drum);
    
    for m = 1 : size(matDr,1)
        for k = idx : size(matDr,2)
            matDr(m,k) = matDr(m,k) + 1;
        end
    end
    
end
img = imgCopy;


