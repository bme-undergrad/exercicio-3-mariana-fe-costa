function [mu] = exercicio3(t, NC)

% t: vetor de tempo com instâncias das medições
% NC: medida do número de células a cada instante t

%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 0:6;
nc = [0.100; 0.332; 1.102; 1.644; 2.453; 3.660; 5.460];

#solução da EDO para qualquer u

function X_modelo = modelo_exponencial(u, t, nc)
X0 = nc(1);
X_modelo = X0 * exp(u * t);
end

#linearização utilizando ln
#y = a + bx ; ln(X) = ln(X0​)+ μt

ln_nc = log(nc);

#regressão linear das 2 pimeiras horas

p = polyfit(t(1:2), ln_nc(1:2), 1);   % usa apenas as 2 primeiras horas
u1 = p(1);                           % coeficiente angular = µ
lnX0 = p(2);                          % intercepto
X0 = exp(lnX0);

fprintf('Durante as primeiras 2 horas:\n');
fprintf('  µ = %.4f h^-1\n', u1);
fprintf('  X0 = %.4f g/L\n\n', X0);

#próximas 4 horas (de 2 a 6)
p2 = polyfit(t(3:end), ln_nc(3:end), 1);
u2 = p2(1);
lnX02 = p2(2);

fprintf('Durante as próximas 4 horas:\n');
fprintf('  µ = %.4f h^-1\n', u2);
fprintf('  X0 = %.4f g/L\n\n', exp(lnX02));

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
