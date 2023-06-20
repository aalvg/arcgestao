<!DOCTYPE html>
<html>
<head>
    <!-- ############################################################################################
        Esse código pertence a tela de login para que o cliente possa acessar sua OS 
        e verificar o andamento da manutenção de sua máquina. LEMBRANDO QUE: ESTA VIEW É LIVRE .DE 
        AUTENTICAÇÃO SEM A NECESSIDADE DE LOGAR NO SISTEMA ARC
        ########################################################################################-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Ordem de Serviços Arena Computadores</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap');

    body{
        margin: 0;
        font-family: 'Noto Sans', sans-serif;
        overflow: hidden;
        
    }

    body *{
        box-sizing: border-box;
    }
    .main-login{
        width: 100vw;
        height: 100vh;
        background: #001B48;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .left-login{
        width: 50vw;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        padding-top: 100px;
    }

    .left-login > h1{
        color: #018ABE;
    }

    .left-login-img{
        width: 35vw;
    }

    .right-login{
        width: 50vw;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card-login{
        width: 60%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        padding: 30px 35px;
        background: #4274ca;
        border-radius: 20px;
        box-shadow: 0px 10px 40px #01112c;
    }

    .card-login > h1{
        color: #01112c;
        font-weight: 800;
        margin: 0;
    }

    .text-field{
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: center;
    }

    .text-field > input{
        width: 100%;
        border: none;
        border-radius: 10px;
        padding: 15px;
        background: #ffffff;
        color: #01112c;
        font-size: 12pt;
        box-shadow: 0px 10px 20px hsla(240, 3%, 87%, 0.692);
        outline: none;
        box-sizing: border-box;
    }

    .text-field > label{
        color: #01112c;
        margin-bottom: 10px;
    }

    .text-field > input::placeholder{
        color: #01112c5d;
    }

    .btn-login{
        width: 100%;
        padding: 16px 0px;
        margin: 25px;
        border: none;
        border-radius: 8px;
        outline: none;
        text-transform: uppercase;
        font-weight: 800;
        letter-spacing: 3px;
        color: #ffffff;
        background: #ff0000;
        cursor: pointer;
        box-shadow: 10px 10px 50px #690303 !important;

    }

    .arenaimg{
        max-width:80px;
        max-height:80px;
        width: auto;
        height: auto;
    }
    a {
        color: #fff;
        text-decoration: none;
        font-size: 12px;
        font-weight: lighter;
}
    .centered-link {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
}
@media only screen and (max-width: 950px) {
    .card-login {
        width: 85%;
    }
}

@media only screen and (max-width: 600px) {
    .main-login {
        flex-direction: column;
    }
    .left-login > h1 {
        display: none;
    }
    .left-login {
        width: 100%;
        height: auto;
    }
    .right-login {
        width: 100%;
        height: auto;
    }
    .card-login {
        width: 90%;
    }
}


</style>
<body>
    <form method="POST" action="{{ route('ordemServico.visualizarServicos') }}">
        @csrf
        <div class="main-login">
            <div class="left-login">
                <a href="https://arenacomputadores.com/" target="_blank">
                    <img src="storage/img/arenared.png" class="arenaimg" alt="Arena Computadores">
                </a>
        
                <h1>Faça Login para visualizar sua OS</h1>
                <img src="storage/img/kanban-method-animate.svg" class="left-login-img" alt="img">
                <p style="align-content: center">arenacomputadores.com</p>
                
            </div>
            
            <div class="right-login">
                <div></div>
                
                <div class="card-login">
                    <h1>LOGIN</h1>
                    <div class="text-field">
                        <label for="ordem_servico_id">Id da Ordem de Serviço</label>
                        <input type="text" name="ordem_servico_id" id="ordem_servico_id" placeholder="Digite o ID da sua OS">
                        
                    </div>
                    <div class="text-field">
                        <label for="senha">Senha</label>
                        <input type="password" name="senha" id="senha" placeholder="Senha">
                    </div>
                    <button type="submit" class="btn-login">Acessar</button>
                    <div>
                        <a href="https://arenacomputadores.com/" target="_blank" class="centered-link">
                            Acesse o nosso site e confira nossas promoções
                            <p>arenacomputadores.com</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    

</body>
</html>
