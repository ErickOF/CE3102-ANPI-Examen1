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


% Test
for x=0:0.025:2
  y = f1(x);
  printf("f(%f) = %f \n", x, y);
endfor
