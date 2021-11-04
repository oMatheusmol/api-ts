const Validators = {
  cpf: (paramCpf: string): boolean => {
    const cpf = paramCpf.replace(/[^\d]+/g, '');
    let soma = 0;
    let resto;

    const invalidCpf = Array.from(Array(10).keys()).map((n, index) => index.toString().repeat(11));

    if (invalidCpf.includes(cpf)) return false;

    for (let i = 1; i <= 9; i++) {
      soma += parseInt(cpf.substring(i - 1, i), 10) * (11 - i);
    }

    resto = (soma * 10) % 11;

    if (resto === 10 || resto === 11) resto = 0;
    if (resto !== parseInt(cpf.substring(9, 10), 10)) return false;

    soma = 0;

    for (let i = 1; i <= 10; i++) {
      soma += parseInt(cpf.substring(i - 1, i), 10) * (12 - i);
    }

    resto = (soma * 10) % 11;

    if (resto === 10 || resto === 11) resto = 0;
    if (resto !== parseInt(cpf.substring(10, 11), 10)) return false;

    return true;
  },
  cnpj: (paramCnpj: string): boolean => {
    const cnpj = paramCnpj.replace(/[^\d]+/g, '');

    const invalidCnpj = Array.from(Array(10).keys()).map((n, index) => index.toString().repeat(14));

    if (invalidCnpj.includes(cnpj)) return false;

    let tamanho = cnpj.length - 2;
    let numeros = cnpj.substring(0, tamanho);
    const digitos = cnpj.substring(tamanho);
    let soma = 0;
    let pos = tamanho - 7;

    for (let i = tamanho; i >= 1; i--) {
      soma += parseInt(numeros.charAt(tamanho - i), 10) * pos--;
      if (pos < 2) pos = 9;
    }

    let resultado = soma % 11 < 2 ? 0 : 11 - (soma % 11);
    if (resultado !== parseInt(digitos.charAt(0), 10)) return false;

    tamanho += 1;
    numeros = cnpj.substring(0, tamanho);
    soma = 0;
    pos = tamanho - 7;

    for (let i = tamanho; i >= 1; i--) {
      soma += parseInt(numeros.charAt(tamanho - i), 10) * pos--;
      if (pos < 2) pos = 9;
    }

    resultado = soma % 11 < 2 ? 0 : 11 - (soma % 11);

    if (resultado !== parseInt(digitos.charAt(1), 10)) return false;

    return true;
  },
};

export default Validators;
