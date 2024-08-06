<script setup lang="ts">
import { getProdutos } from '~/services/produtos';
import { onMounted } from 'vue';
import { type Produto } from '~/models/produtos';
import { type Ref, ref } from 'vue';

const produtos: Ref<Array<Produto>> = ref([]);


definePageMeta({
    middleware: 'auth'
});

const produtoTeste: Produto = {
    id: 1,
    nome: 'Produto Teste',
    preco: 30.50,
    quantidade: 50,
    categoriaFK: {
        id: 1,
        nome: 'Regrigerantes'
    },
    fotos: [
        "https://m.media-amazon.com/images/I/61WGKm79FgL.jpg"
    ]

}

onMounted(()=>{
    getProdutos().then(pagination=>{
        console.log("pagination", pagination)
        produtos.value = pagination?.results ?? [];
        console.log("produtos encontrados: ", produtos.value);
    })
})

</script>

<template>
    <main class="home-container flex flex-column align-items-center justify-content-center">
        <h1>homeee</h1>
        <div class="produtos-container grid align-items-center justify-content-center">
            <ProdutoItem class="col-4" :produto="produtoTeste"/>
            <ProdutoItem class="col-4" :produto="produtoTeste"/>
            <ProdutoItem class="col-4" :produto="produtoTeste"/>  
            <ProdutoItem class="col-4" :produto="produtoTeste"/>  
            <ProdutoItem class="col-4" :produto="produtoTeste"/>  
            <ProdutoItem class="col-4" :produto="produtoTeste"/>  
        </div>
    </main>
</template>

<style scoped lang="scss">
.home-container{
    margin: 0;
    width: 100vw;
    min-height: calc(100vh - 80px);
    background-color: red;
    background-image: url('background1.jpg');
    background-repeat: repeat;
    background-size: cover;  
}
</style>