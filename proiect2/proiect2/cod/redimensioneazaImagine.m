function imgRedimensionata = redimensioneazaImagine(img,parametri)
%redimensioneaza imaginea
%
%input: img - imaginea initiala
%       parametri - stuctura de defineste modul in care face redimensionarea 
%
% output: imgRedimensionata - imaginea redimensionata obtinuta


optiuneRedimensionare = parametri.optiuneRedimensionare;
metodaSelectareDrum = parametri.metodaSelectareDrum;
ploteazaDrum = parametri.ploteazaDrum;
culoareDrum = parametri.culoareDrum;

switch optiuneRedimensionare
    
    case 'micsoreazaLatime'
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = micsoreazaLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        
    case 'miscoreazaInaltime'
        %completati aici codul vostru
        img = imrotate(img,90);
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = micsoreazaLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        imgRedimensionata = imrotate(imgRedimensionata, -90);
    case 'maresteLatime'
        %completati aici codul vostru
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = maresteLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
    case 'maresteInaltime'
        %completati aici codul vostru
        img = imrotate(img,90);
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = maresteLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        imgRedimensionata = imrotate(imgRedimensionata, -90);
    case 'amplificaContinut'
        %completati aici codul vostru
        img1 = imresize(img,2);
        [H, W, ~] = size(img1);
        [h, w, ~] = size(img);
        nrPixeliLatime = W - w;
        nrPixeliInaltime = H - h;
        imgRedimensionata = micsoreazaLatime(img1,nrPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        imgRedimensionata = imrotate(imgRedimensionata, -90);
        imgRedimensionata = micsoreazaLatime(imgRedimensionata,nrPixeliInaltime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        imgRedimensionata = imrotate(imgRedimensionata, 90);
        
        f = [1 0 -1 ...
            1 0 -1 ...
            1 0 -1];
        
        %imgRedimensionata = rgb2gray(imgRedimensionata);
        
       % imgRedimensionata = imfilter(imgRedimensionata, f);
    case 'eliminaObiect'
        imgRedimensionata = eliminaObiect(img,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        %completati aici codul vostru 
    
end