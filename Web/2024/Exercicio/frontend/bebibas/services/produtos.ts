import { type Ref } from "vue";
import { BACKEND_URL } from "~/models/app";
import type { Pagination } from "~/models/pagination";
import type { Produto } from "~/models/produtos";

// export const getProdutos = async () => {
//     return await useFetch(``)
// }

export const getProdutos = (numeroPagina: number = 0): Promise<Pagination<Produto>|null>  => {
  return useFetch<Pagination<Produto>>(`${BACKEND_URL}/produtos?page=${numeroPagina}`)
    .then(response=> Promise.resolve(response.data.value))
    .catch(error=>{
        console.error(error);
        Promise.resolve(null);
    }) as Promise<Pagination<Produto>|null>;   

};
