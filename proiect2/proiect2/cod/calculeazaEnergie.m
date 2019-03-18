function E = calculeazaEnergie(img)
%calculeaza energia la fiecare pixel pe baza gradientului
%input: img - imaginea initiala
%output: E - energia

%urmati urmatorii pasi:
%transformati imaginea in grayscale
if size(img,3) == 3
    img = rgb2gray(img);
end
%folositi un filtru sobel pentru a calcula gradientul in directia x si y
f = fspecial('sobel');
%calculati magnitudinea gradientului
dx = imfilter(double(img),f);
dy = imfilter(double(img),f');
%E - energia = gradientul imaginii
E = abs(dx) + abs(dy);
%completati aici codul vostru