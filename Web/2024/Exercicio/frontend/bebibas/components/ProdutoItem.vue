<script setup lang="ts">
import { type Produto } from "~/models/produtos";
type propType = {
  produto: Produto;
};

const props = defineProps<propType>();
</script>

<template>
  <section
    class="cartao flex flex-column align-items-center justify-content-center"
  >
    <div class="produto-imagem">
      <img :src="props.produto.fotos[0]" />
    </div>
    <div>
      <h4>{{ props.produto.nome }}</h4>
    </div>
    <div class="flex flex-row">
      <span>R${{ props.produto.preco.toPrecision(4) }} - </span>
      <div class="ml-2">
        <label>Qtd. Disponível: </label>
        <span>{{ props.produto.quantidade }} </span>
      </div>
    </div>
    <Button class="botao-add" label="Adicionar" />
  </section>
</template>

<style scoped lang="scss">
.cartao {
  width: 300px;
  max-width: 300px;
  height: 350px;
  max-height: 350px;
  background-color: white;
  border-radius: 1.5rem;
  margin: 1.5rem;
  cursor:pointer;

  &:hover{
    transform: scale(1.1);
    transition: 2s;
  }

  .produto-imagem {
    width: 100%;
    height: 65%;
    max-width: 250px;
    max-height: 250px;
    img {
      width: 100%;
      height: 100%;      
    }
  }
  .botao-add {
    width: 80%;
    height: 2rem;
    margin: 1rem;
  }
}
</style>
