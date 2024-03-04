<script setup lang="ts">
    const credentials = reactive({
        username: '',
        password: ''
    })
</script>

<template>
    <main class="flex_center login_main">
        <section class = "logo_panel flex_center">
            <img src="/sge.jpeg" alt="Logo do projeto sge">
            <h1>Sistema de Gestão de Ensino</h1>
            <p> &reg; Senai Roberto Mange</p>
            
            <div class="stars1"></div>
            <div class="stars2"></div>
            <div class="stars3"></div>

        </section>
        <section class="login_panel">
            <div class="login_content flex_center">
                <form class="login_form">
                    <div class="input_container">
                        <CustomInput label="LOGIN" inputId="user_login"
                        v-model="credentials.username"
                        />
                    </div>
                    <div class="input_container">
                        <CustomInput label="SENHA" type="password" inputId="pass_login"
                        v-model="credentials.password"
                        />
                        
                        
                    </div>
                    <button type="submit" class="customButton">ENTRAR</button>
                </form>
            </div>

        </section>

    </main>
        
</template>

<style lang="scss">

    .flex_center{
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
    }


    .login_main{
        width: 100vw;
        height: 100vh;
        background-color: var(--dark-background-color);


        .logo_panel{
            display: none;
            width: 50vw;
            height: 100vh;
            flex-direction: column;
            color: var(--light-background-color);
            img{
                margin: 0px 0px 25px 0px; 
                width: 65%;
                height: 45%;
            }
            
        }

        .login_panel{
            width: 100vw;
            height: 100vh;  
            background-color: var(--light-background-color);
        }
    }


    @media screen and (min-width: 600px) {
        .login_main{
            .login_panel{
                width: 50vw;
            }
            .logo_panel{
                display: flex;
            }
        
        }
    }

</style>