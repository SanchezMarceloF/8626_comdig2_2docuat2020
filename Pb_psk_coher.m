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

function [Pb, Pe] = Pb_psk_coher (M, Es, N_0)
# Función que devuelve el cálculo de la probabilidad de error (Pe)
# y probabilidad de error de bit (Pb) para una modulación FSK 
# con detección coherente para Es/N_0 >> 1.

#Extraído del libro "Digital Communications, 2 Edition, Bernard Sclark"
	
	if (M == 2)
		Ne = 1;
	else
		Ne = 2;
	endif

	k = log2(M)	
	Pe = Ne*(1-normcdf(sqrt(2*(Es/N_0)*sin(pi/M))));
	Pb = Pe/k;

endfunction
