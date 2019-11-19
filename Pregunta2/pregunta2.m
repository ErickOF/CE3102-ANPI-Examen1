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


function x = thomasAlgorithm(matrix, d)
  n = size(matrix)(1);
  pi = [];
  qi = [];
  for i=1:n-1
    if (i == 1)
      c1 = matrix(1, 2);
      b1 = matrix(1, 1);
      pi(1) = c1 / b1;
    else
      ci = matrix(i, i + 1);
      bi = matrix(i, i);
      ai = matrix(i + 1, i);
      pi(end + 1) = ci / (bi - pi(end)*ai);
    endif
  endfor
  
  for i=1:n-1
    if (i == 1)
      b1 = matrix(1, 1);
      qi(1) = d(1) / bi;
    else
      bi = matrix(i, i);
      ai = matrix(i + 1, i);
      qi(end + 1) = (d(i) - qi(end) * ai) / (bi - pi(i - 1)*ai);
    endif
  endfor
  x = qi - pi;
endfunction


% Test
matrix = zeros(100, 100);
for i=1:100
  for j=1:100
    if (i == j)
      matrix(i, j) = 5;
      if (i < 100)
        matrix(i + 1, j) = 1;
      endif
      if (j < 100)
        matrix(i, j + 1) = 1;
      endif
    endif
  endfor
endfor

d = [-12];
for i=1:98
  d(end + 1) = -14;
endfor
d(end + 1) = -12;

thomasAlgorithm(matrix, d)

