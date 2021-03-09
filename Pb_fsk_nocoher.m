## Copyright (C) 2021 MarceloFS
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} Pb_fsk_nocoher (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: MarceloFS <marcelofs@marcelofs-X455LD>
## Created: 2021-03-08

function [Pb, Pe] = Pb_fsk_nocoher (M, Es, N_0)
# Función que devuelve el cálculo exacto de la probabilidad de error (Pe)
# y probabilidad de error de bit (Pb) para una modulación FSK 
# con detección no coherente.

#Extraído del libro "Digital Communications, 2 Edition, Bernard Sclark"

	function [val] = M_j (M, j)
		val  = factorial(M)/(factorial(j)*factorial(M-j));
	endfunction
	
	suma = 0;
	for j=2:M
		suma = suma + ((-1)^j)*M_j(M,j)*exp(Es/(j*N_0));
	endfor 		

	Pe = (1/M)*exp(-Es/N_0)*suma;
	Pb = (M/(2*M-2))*Pe;

endfunction
