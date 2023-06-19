
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap');
    body{
        margin: 0;
        font-family: 'Noto Sans', sans-serif;
    }
    .main-login{
        width: 100vw;
        height: 100vh;
        background: #000713;
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
    }

    .left-login > h1{
        color: #184faf;
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
        color: #184faf;
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
        background: #184faf;
        color: #f0ffffde;
        font-size: 12pt;
        box-shadow: 0px 10px 40px #01112c;
        outline: none;
        box-sizing: border-box;
    }

    .text-field > label{
        color: #f0ffffde;
        margin-bottom: 10px;
    }

    .text-field > input::placeholder{
        color: #f0ffff94;
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
        background: #184faf;
        cursor: pointer;
        box-shadow: opx 10px 40px -12px #012a6f;

    }

    @media only screen and (max-widht: 950px){
        .card-login{
            width: 85%;
        }
    }

    @media only screen and (max-widht: 600px){
        .main-login{
            flex-direction: column;
        }
        .left-login{
            display: none;
        }
    }

</style>
<form method="POST" action="{{ route('ordemServico.visualizarServicos') }}">
    @csrf
<head>
    <meta charset="UTF-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Ordem de Serviços Arena Computadores</title>
</head>
<body>
    <div class="main-login">
        <div class="left-login">
            <h1>Faça Login para visualizar sua OS</h1>
            <img src="storage/img/kanban-method-animate.svg" class="left-login-img" alt="img">

        </div>
        <div class="right-login">
            <div class="card-login">
                <h1>LOGIN</h1>
                <div class="text-field">
                    <label for="usuario">Id da Ordem de Serviço</label>
                    <input type="text" name="ordem_servico_id" id="ordem_servico_id" placeholder="ID">
                </div>
                <div class="text-field">
                    <label for="usuario">Senha</label>
                    <input type="password" name="senha" id="senha" placeholder="Senha">
                </div>
                <button type="submit" class="btn-login">Acessar</button>
            </div>
        </div>

    </div>
</body>
</form>