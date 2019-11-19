## Copyright (C) 2019 
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## Author:  Erick Obregon Fonseca
## Created: 2019-09-20

close all;
clear all;


function y = f1 (x)
  y = sin(x)^2 - x^2 + 1;
endfunction

function x = metodo_biseccion_mod (a, b, n, tol)
  if (f1(a) * f1(b) > 0)
    disp("Cero de la funcion no se encuentra en el intervalo");
    return;
  else
    iter = 0;
    xk = (a + b) / 2;
 
    while (abs(f1(xk ** iter)) > tol)
      h = (b - a) / n;
      found = false;
      
      for k = 0:(n - 1)
        ck = a + k * h;
        ck_next = a + (k + 1) * h;
        
        if (f1(ck) * f1(ck_next) < 0)
          a = ck;
          b = ck_next;
          found = true;
          break;
        endif
      endfor
      
      if (!found)
        print("Cero de la funcion no se encuentra en el intervalo");
        return;
      endif
      
      iter++;
      xk = (a + b) / 2;
    endwhile
    
    x = xk;
    return;
  endif
endfunction


% Test
a = 0;
b = 2;
n = 25;
tol = 1e-10;
printf('xAprox = %f\n', metodo_biseccion_mod(a, b, n, tol));
