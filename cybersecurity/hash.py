import hashlib

def calcular_hash(texto):
    # Criar um objeto de hash MD5
    hash_md5 = hashlib.md5()
    has_sha256 =hashlib.sha256()
    #has_sha512 =hashlib.sha512()
    # Atualizar o objeto de hash com o texto fornecido
    # hash_md5.update(texto.encode())
    has_sha256.update(texto.encode())
    # Obter o valor de hash em hexadecimal
    return hash_md5.hexdigest()

# Exemplo de uso
texto = "Olá, mundo! A"
hash_resultado = calcular_hash(texto)
print("Hash do texto'{}':".format(texto))
print(hash_resultado)