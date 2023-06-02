-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Jun-2023 às 22:42
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `arc_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `abertura_caixas`
--

CREATE TABLE `abertura_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) NOT NULL,
  `ultima_venda` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `abertura_caixas`
--

INSERT INTO `abertura_caixas` (`id`, `usuario_id`, `data_registro`, `valor`, `ultima_venda`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-05-29 18:56:22', '10.00', 0, '2023-05-29 18:56:22', '2023-05-29 18:56:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED DEFAULT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `data` date NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alteracao_estoques`
--

CREATE TABLE `alteracao_estoques` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `apontamentos`
--

CREATE TABLE `apontamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor_post_blog_ecommerces`
--

CREATE TABLE `autor_post_blog_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro_deliveries`
--

CREATE TABLE `bairro_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `valor_repasse` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `banner_mais_vendidos`
--

CREATE TABLE `banner_mais_vendidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto_primario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto_secundario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_delivery_id` int(10) UNSIGNED DEFAULT NULL,
  `pack_id` int(10) UNSIGNED DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `banner_topos`
--

CREATE TABLE `banner_topos` (
  `id` int(10) UNSIGNED NOT NULL,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_delivery_id` int(10) UNSIGNED DEFAULT NULL,
  `pack_id` int(10) UNSIGNED DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrossel_ecommerces`
--

CREATE TABLE `carrossel_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_acao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_botao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Produtos', '2023-05-29 17:28:32', '2023-05-29 17:28:32');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_adicionals`
--

CREATE TABLE `categoria_adicionals` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limite_escolha` int(11) NOT NULL,
  `adicional` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_contas`
--

CREATE TABLE `categoria_contas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categoria_contas`
--

INSERT INTO `categoria_contas` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Compras', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(2, 'Vendas', '2023-05-05 12:53:20', '2023-05-05 12:53:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_despesa_ctes`
--

CREATE TABLE `categoria_despesa_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_post_blog_ecommerces`
--

CREATE TABLE `categoria_post_blog_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_produto_deliveries`
--

CREATE TABLE `categoria_produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_produto_ecommerces`
--

CREATE TABLE `categoria_produto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_servicos`
--

CREATE TABLE `categoria_servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categoria_servicos`
--

INSERT INTO `categoria_servicos` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Serviços', '2023-05-30 19:43:23', '2023-05-30 19:43:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `certificados`
--

CREATE TABLE `certificados` (
  `arquivo` blob NOT NULL,
  `senha` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `certificados`
--

INSERT INTO `certificados` (`arquivo`, `senha`, `created_at`, `updated_at`) VALUES
(0x3080020103308006092a864886f70d010701a080048223a23082239e30821dd306092a864886f70d010706a0821dc430821dc002010030821db906092a864886f70d0107013028060a2a864886f70d010c0106301a041422d75ab491f9e951385a1a366a76e00d2a38917e0202040080821d808a0abb5114eb10015a60924d26ac86593c9a88dd57690725c43555d56c17b6c44eee32e71d074e608ef866463798d1d0d1b49518bcd2d4dc87a6c5aa6577bc201af4864a4db8a14584aacf095b92048fe0f6365d214b1516eeea421e78745e3acfc57e58e06f7d8bd59b15109c5c06635384d02591538caf471bf7a66f38361556b51bb8ee4baeb82192baf5889b61c7d649e9ff98a418db2b0ce6acaa123a94f4da0796b47d3dd3f8cd4d831885a762b495edc28fc5f9a1d9b047c4ca8c966dcfc330047117ac20e4240100bc3649be9d027316dd68e9e3c6c5914067e990495bd9163a89b2f657fa89a563f8dd54c82a308c4de8685eb01287490eb2733b43cfb3d7b516aff6b4bb99d7b3b021ee6d7c120c985b2910511bd3b92086a865ad6986a64100e05f5cb50e20f159b35d91dd43bc62e15f5d164916be5a4ed68dc6b89a1e077ec1506783574f8af1212cbc24583596816fb3aeee960b92afaf4693501109037921211ca6e0062d07b10f34ebc8739bce668f972e716f2e4db9fb83d7c74328e77e009aac95482d5325a2eafdf9a3b442fd5d7b1f785a33ec56a907ed55a672b3e35c54f38cc66830568022df9785a4257567e750362f95ce926906fbf258449ec691e2d50a0a89d6f3a6409f46a411cd8fd2074c351bbb17868cde4e748e43b396c9acb21dc4e34cd37a379edf033a345264c97fe002db4bc9477f857dbf0c132aad889a30d3edf32cac83bd30af9c6f81da237fe77917cd55dee83f3372b935c045c5fd2247480d7c1dfb9ea5c91435b1ed5a42a21b4b5dd8080ba73ba24f340be9c175a00c53ee22b998047ca2e70360ff1a1a12fee6428883c36db81a1e79ffffafff5e88f3038d6f5ebc90404854fbe09544958e800480b349df9fc1f046aaf0090a97a7f36b24cfa63e8009d0fc659ea97d0ba715da0fdcdb0bbc0f626cef352f91882724c122ccca71ed89f3794e169e40cc0d78bfcb082d244f458cb66476aa8d2793fd41abd21986f4c2f1756211d8904829f57eac21f5e1241cbd57d143a4257cd25fc7b3289f16f6c31f6e75578c1d65715c5cf8ab66b2790f14094fe08cff3178301fa01d985d176d49412f9197ed756fcb5f7b5d8fa55d5c8a8165e9866c56dbf1380ab6fb0b1e31fa17c4e1c4f2772663da8bfb3236f176cefa64b114f92235e6971778d2dabdb144269b5e6e57732f700ae14f74ce6193ef0d3819b348a6156cf8db6dd0e53e04b6a5d807156d9a081b5a682b24255a0a7253ee06dfc171d3a07978f8631a4f32c58a9f759911309562c7f38f6e051f6ead222a531d5b26c2540c1c8eed9e502e9f4cd200377f1ce108a306f1700e0c495b375e14730cd0f3295c0ab7ac8e2832a9fb4cc09c866ce7ab4a270ef4ef1febcd4c8a55a60271a56a24b1ac203ff5d294af18e295332ef9ae09e1f09098cef3b623aed788e35ca819b41c9b871f15391ec3f0b0b2cdcd65a98c57e50b201caa918a1df4881dae3f43fce5a9330395d9543529383a31000b1d4cc6f6f56b378ed7887e791e778d2e915a1fc2903675d665055751f68b18b1dae64e5b0405592f0b8d02e27d540c1abeffc836b8bfada1a14b8ea05fa0a6776c65eb463c124e1be30bf7d4d5fdf4738dec43f843dd8ada2829f91e944f9d896f260e29b767fdb8c42d29b55517ec62e9ac96a86aa533b93c1a0ffcd488b3370cc51168f8187989094e929f376e14a1162465588202e7e731a1d0a8147995231b0c04081be5574b9f2a12bfa14269067f3266cdb98ac8d586ae23fdc9269ccfe9efb3e1f91b43a647c8541b4fd39d7e1b2a59172981341bee87e55945d312c77b160553d70c979c70bf990ad6302a4f6cd836a2f6c647a5ddf82914f9d4e002ae2dde51c1b7f9d7d858d32d71ba6c039ed7ad49228533305056a283ac56d10ad6c6199979dae32feb71587754d925050c0cd7d8878faee264581634731895f91a416e4ecaba381bb48f3d47ec646ee0d01a7c53c697cd26e3dcce928b2d518e21169e7abcab5d14da8254870d4df6ee228bd3d379737743ea3aebb4ca3c618963b7fe98e9d66333370afecb58d644e0c7214ce6f46140035aeb25ee43b124d95aa10bdaebb814eb428b93036ef07c013fdb38ae0c7cd888b116184a74735fb7167a4cf95267f16cf373eb0114357532661168a067f4e06ffabdddd83809e234e948842565f2521e1f55a45ea34c4e93495d1bd4c8aaf8831a1854d5918b06c5cb71969fb5b20a06f13a0b7ea96e97109f50bc9f394e1c7d02849cbfbd3fa607f92316c75d6a120142462cd1b00ddc41729ca09d93dc7b74e2bd5b497dade07debb527b2b560a24950a162c87f308b0abd5764361ee019a9c869ebb48be79e86ad2d5edcbd82512fba15617c3fc1ecc421153d04cf325da203d76ecf58ed6ef691d8e1053fc8504f09ae5f6a76c11f5a9f885984dcfaea6f99f64c28d0857ab9f507596ec82c7ed0636da2e173e1bf5bd02d71018f70e57fb8816388610779f01d4dbb535ba2b1e91641577ecbd3eda1e091462f8c23fda32abf6f484659fb1763b37070794dd8f54e85b3eaa547d7dfb3adc67504837b95402acf1aadbcc2caf7d71b6cebd5171082ab24c32c49f5bc13b0098e47a3fa849b9e0068e737f335a31f2fd13c5bef27405af0ae223aedf80dd2fedf81f19eb524c2ec76f7562a98cbd653de643194774ecb8fb6944f34ee47f8ccb0b3199e21351519fa3200c06760b6575bfe014bcc21b44b79a9b32dd8fc3f150e2aeb159e08799af71c4805d1aeea2d7a67b7433645f39322b68023509e6ce86ba381bef92e09c8d11455be251f250b8ddf79c52fc52179a0951c09c02b8b81ed6a7c4813e574c03f727ec96fe850605493e7dd21a307a074dd234d1cd2763bfd4ffe853c8233a6cc43dc0ae5b24bda9d4c01ba77e32db213a2cf041fea5fbe61a50d26f25633682061305bf875484d79918db58858160449a9ecc5081318bcc9fa7c047bab71bc20ca9c2a0f8a4d180f478aaf27c6e1aed92ab7f4af104d69e46d7233cd21ecfe78e3ae0ef8c2c040023b5e5fb12f7ab765fa81a290582f75bf9e293711c0fff96571b5abbd5b9c5a6fc98537ec751f38086b7148f482c591a7641de2d0b2657722f576127800abfd0c608d72d5a0e8f98dc3db60128eb564b169c8b958e0db36f42fd66264c6323daa52115e4a8be58a713c45ea66b48c50a66c8231188bb11033e06353398f701686a4ad7f56122d86bd09ce88251d0a2edb69ac4e308477de38c04eae7a51c83ca80cbdd04cbd3726bc1289dec90eb97bafcef704057b8dc9a30d2c8a3f004bb352f07aeff137fc6d5766dedfd3c1e59f87c1a39e256ddc35a6e6819d4e55da1ce945449ebe4041430f61a39b300ccc9e55d679897da6e817eb92af633c835cccdde9f683ce2185c20d0d77d26c5ee38ab50f7572e4f2a82a2c267d43d0e49b03c8258e93d2e6226134e26f9fa52243351925c4b53f45a1d2d7ad58eaff9a568cfa6aec3c224c20db6491e1f64e47cc0a599a04fb9655a42ccfc6e382d7352ba053f1471433bbeb31107c0494120789296c2585a7ece61defffb9f1f4dba0fc77fbdb931c43bcf7a9dd3719145f98e8224b756c904bc78b2a77cbd94b4fd31597ec9ff1ba52d8b3c87f88cbe3e7de7fb2e252d37629ab66922be9f81dc0cad1ab9f4903f0aa125530343b95460ce2ac218e20afcff30b4e39fc3f2ed69f9b72a7f604cd5e7647f37fab311df50a04a31820220664d361de647c71a4aa3b5132d3e1b0447b9f36a0cb5150c320a1cb3f496d47f60173d14936f4516a8205003b17ce8f1fa17aba1fbea8720f514944e068eb6d0e4b7b06fe79ff5aa72eec438a6a5cb42f27b7578e9e9af30d54776ccee1e4d35ef848fdc6ba9e9c34179f86b34bc0799f6b4e22f465387836695faed520de20e7f5a3ad7d23b2a23906f5ae835fa702141f0f65141a35172d74dcdae0e9a576589b04d0b69e8ecf2ff61a0d4f5cebcc28879c148b55a56c5127387099f00a540f4830baea7ed171b35382b878dc9bbeeb03775437f676ebda5915b9a49b0279150eebca4c1d404e69ca7cbb6465efb405f8240e393c54031970d36e3a962f4300d48f771a0d20da6a937049972f11a778d919711507a0372077e900af93d66790701234df052a48a26cb707475dcb2a8ecf2479b1e950357bd23819796bed735ba922434ae7b9cae3c2bf8103e05fd269aa834773a66229a37109ba326105126ce44da7170bf64d2281c16360a366bd881a17aa5d949f993ceeb09e35aba2fe7a0676aa79d103502bcd1b14ec99ae1e1394b9cf4b6b1813aa5ddfc5a7d8c9009d956bbb3f109ce8f465165c268527dcc41cd5e3e5d0097ede09675d506203326c442f5b96f834daaba3f3d5edd815ff570edaf8bbd4ff3302cc316d2ac6b140d63f057df9bf940bfaa9d9a32747a2891bdee67331d6edadeb44b6702b86895b5f8c99ca3ab706dbf2d70f0cad20ead2ead079fbacb8930072cc69c3bebb2f3dd81a4ceb32c0205dc8ed96330a0a46424498375223d5557b55b1be911645e8c73ff10cb8027d558558560cf074cb71623ec2edcaf8b3d6cb6d3923b6e73490374eb98442d3466951f555775824c6d34b881a1ad30688b8460cba06ae6f8b9133aa91a591c28efe4709a0d0dd936bf4c41121da72957f41c772ca6b481c5c98f0365ace0d08b9507f57131c5dcb2ef0af79306960393a5a44ff955f2fe2f2458a5ce699447463978a5d278241337eca209187dc0e7728f12c160ca441ccd9fe45405ba29324f269983f540afe511aee03258d439a9537c9a2d69329acc1fcb5fb0e64ec9fae344d89f68dba6e78a741a45f43a9c2b8ea76877d1aec2989515b75c9c11f2f1090fb40f1d27258819d3fee03416d04b8dab78a7347f465fa880c88b9039c2ddbb86ab3392dcf5dbb2b2eb9f009c3d28c7332f64c3afe033b89244fb083785ca1243b3442ad75a5a7ab18382319705d283f5289adb42bd4991f3ed8a06eb0fbb211c6d982c292982a0c8bb46bb71d2fbacae7dcb8f8afea4e70c6a0456feb5389f81bc5254747e2263aa8b5727b50892072396275ad1230f51325fc5aa0e49b60a8fbc5e0c377235b3f6a458094ed65e235150f61debba3baa04400b61381ec4b7c57108981c64c1c25d12f50940bd20253736cf74cfe8900027783543d38ecc9f497d4ca407802b5ef087e6e0911903427b48b3f4dc152ba133195fe7c764bcab2c42f39620291347adc1bbea8275f88affebf4ea27ee7167c48aaf756acc609d1c012032f30d6b3e7d23bfb0c39184a10800bd1f94c36c0eca91b2724faca0110ca3ac26c36aa2b0a0c472086b2dd2656aede0012ce105ba473fb4de0227512ef0dc540a3b54f38f13a01abaa578946d07d985d49e42a9ed58c5686433b59ece7a850d924fc0f64d5085a6b11226b2895c4806821a3bbe6704fd65d0c14ee124a262dff67d9abfd634e599b03d4f90fcba44ab42ce4858e2d587dc0d277bb8784abb97798c870719ecd096e91d18b8811d1b16d0bc537bc67ee78b1485a276736cff8d054fa76dbf2804805d558c32e965af8fd3669756d541fe34918ab5ce16980d9a3dd9a59ca757dd4f5699c45508e520e1b51f6a7d353a46e8b5b5d2bc912eeeb9cbe1286c5b8dc2fde5049950d07279064aa35d8ecd8d5eecd96b8e15eb15a1f4fd366d8eb287e4329148bd0103b4d050e97bf73f1b3e460e3920d7c41fc1ce3c3938218ff652577aa9ad9ae27c5ffbea1e94ff7bd93987e5cac8cbc3aea482f30a030fb7c47c72b94d90de6466533de2daed3546da8424c873691bb06c57ce8efef28731f9b42f344dad23bd59bcf591b1acfae86b4d6074a00d541164fe5912fb30e61679f858a26fa9c8377b08463202c0fae8792a758684a248e31285ae3c26a3619b2886171a9f90dfb3998d0644fe8029d57eccd11ffccb534a8b8461297852acef9a8704f6625664c34840111e567e8642950dcb5203309c992052d0a9d56cf34bd167558122a4ca81a93f7cf2a022a59f1276bd470c3ac01b8453bc574b23fb710e53dbf38e811ccc6fd77fadbd470137fc99895cd2359af4ea9f95f64c4a8ac91fd892f75d50cb47dce286805f28551c047a51ca765d1cc5ee056a1981d97ecefa989dd605007091c1a3740ca2e9d31fbf1828f5badac791c9938c185cf5815d8bbe37ee38039cfe325781c17937827950048c291bf4129df6daf6f89be91702abc5a3a711ecdad6f27eccfa1bb1f2fe8e8c879da8dc10db89cc0e14003fdb42ec77fd3f4d84e116a11aad2a5f77af68e39485dc43692cd37867bad4437af58fecc871c1d627adaf3e3c586c4106c3d2a477ec6a75caf83a185383592704472d5567dcaca88a182c2aa9459054b071479f708bbcd5e7bd3a79917862f7dc01697651db62f531192406e99c3ad6d6e35732fe9de65b74362877a366dc70456358dcf33fe02a65dd9c493c0736200ef6978b2f3002797cc554faba0d9472f9f3e7ecd09e8e35a96e064574ecbafd981f368d83aa67dad06a8357ad9f88c14e0eb8eecd8c0511c8cfa330cd26e767aef1506a28d060790aba9cbe71d7b1ac7ac462f572a74299bf04265dadfe1d4c654dc5c6a5d1e791e1bdad3523c5da6d5041846873ed520a14ffee275dde1d33b806509a2f9d574957469aaeb6de6731c42d46c25eb36db03e5379e958ad431fa2529868f2523be1a6d2e6ddd36ab2adcf9f7b03bcabc5a55fa17d49a7a5dc6922eeff8d10461732ab30490949b4439cbbc89ef3e072918b86ed322db6e76ab221a0bf960465a260484d3e789cbd4b16055d7e09fddaf843a969009ed7b59eac8111e55ef26c723f6ab3e6934f4c806da5a26bca811aab789b506361c8b37183b3c53ed597b5ce7f30e6c9fa6b2a7366e1440f854c56ea3c290450b177548ece428df5a41dac4f224625bf7e841cd1574913b2b498010bdaf251aec64c78fc4fd5cae6062873bb6ec7dde26c0866c4f7b3644205b7c786a2f16333648ef3154f83b6e068ebfbca4f794bba5e6308e395df21364cf634021e7a0b10e6a639558e9cfc09100ff55183c0c7d4415db9fbc84e8f6728403182e6d7069fca3b0bc3ae241169e58dd3baed633900a2e2c5a21725c5305f655fd0e290c3dbe2fe4e1da6be27e96f8a8b8b1bf68535a6626ea2f2e2d1189f17d7821e51e0956074035a0e438f666675ff2aa7f56ab30ce7af9d217a3c5c17dbf0e69a702c294dad0ca2db2fdeb60d151847e621e8477a811f704b8a8401bb5ce0035b5dc813276f12a2be6cf9b588276e95b70c8a50d933e19d20e1a9be7574936809e61f5fd008d31dfabd542aa6ebf98b7580abb60be6903eaae46204bc1ba588f519c0d4da2d6af6155f631b0e6244a9308d5b1e6722f5baee4602bf13962c61981fce196269f68364080cdb9b9367437261a8bfc12da00e92c12ff3b9933e60d7e91c10ba8e47531388ae9b29156ea4383e5a25ba1a0b2fd1f0fa0a69e9559a568c7ca1694d3b4e9f6896960cb153bfa0f99739808bc75b7955c1c3c065f0d2b6d364540faaa76e090186b95c989d102f5c85b041a46ec4f9eef1e560bd18bc785a8224b2bbbcc1f1db89eb066a73a16ec7fec65a3ffa0ab6341dead864c286d7c716b1bb98bd92d863145254f42615065036843b6fefb4df170698576ad3f40aecc0b1214ffc752b5568e18b698789f813a5905103a8df224b7724fcb899acd804276c7756351d5c01055547ea4cb7907fc16710f703945946f31b63ea397c16ee7bb31d2b533429d9b6fdf2c2309ea135b107c9dd9d81098e3b70af76949a0d395190101507cf4823edf14a474af7df5b99067938b7d304cf7f530ad598156cbe4bec6abc3f21eeed088b6c9206ee7adacd7d9e34a329ef8ba55f6fea6f72071e0cc24d7190c1efa78e5c690f05d84fb3ac2080fe3ca6e95391a488d8199317089a8a2a6c68e176cb6321d3eac31a20198a623c46cc9f52d4f155fd135a6b0156081f680ba4680ca4354b2f7c09bfcb9fe27bbb8d109ce1879f5c5d343befee105e0d73c94a4886516ceaa1ff2d8455118ebaf53f1ee8fbea5f13180397f5ad677f308b0d4a89a968d8d22cbe60eedb6fe975a1190cf4b4abe3a5a7064a8a4394db684183c9e96e49726444ceaa84691678debf6e104494f67a6e7833ca64d76bec2533a75c9c1ff378eddbff49a8543b087be7f49b5f4a63bc8feb3f7cbfd2c4f99eae4b8cdde87b8a8fad521c4df036fef7ae350e2a92b1d301b90e3dd97c34d63dbadf6816868ddce106e6b3a326cb9cf9d33e4f97c62fff4ade6fb88fb28eccf5acb4e58f84ac4e9ccacd9d96339247df9de0d23690a31f5dff4b10bd6f0f1da1f9bff4b1de73b745eed5e4f8a9cec729825125b377bbb0288f699e5a72d0fef3005052195369a0fbd724875f49a8f6b3cbe56b9757e0b80e0fae2bcc225852dffdc6e2ab4ebdd1ac2e365d8b43a94479ebd7fd93ae37ed7561de76f2b1280748154be759b91ac7bdba6ee32a1202bf3dde1a64d24df46dd14cbbf7abb25cded9a811ef2d81a38ab911b43d771df052e8b064091ccaaf153b0d5fc16e910d683485fc00053d97902e11a7dfeda3a9c121b0286f3505be4e3c62e2566e016bea127338b92f1ec3017539bf0740c1ca4ac4ac04bb69511816ec58482b64f1d1f178e876de6d173db20b43fc79e90e0b434b7f21ebd16e06afdc8a5a54838bcf1557bac6b059f2609efaa0e3bdce23fc6e0505edb2371b59fc7b389e5a75e27a3e3a405241b1a3971c92b8f27a8d08b28ad97955fafbccb829e9ed052b5c9b475442c0e16fb37b7b6fb894b9e2b0558089e49e8c8706ef0a01d1ebbba6e8711b0ff2b6dab810a935122d42167a6b10db2f7b97d307600ee84e60c29436c96f912029d9cae25b3f3af6edb41a0c4c85a64c41d125543a1098d6c1c8a35ef5486b4e09d894c005235d28d8493f224800ef0a3f3d6d15be1a0f680dab485d7ef4de0ada3646966d96112da0bc7b55a958d1202890bd9d49e3163907ee7ee656bea6ac8244d07debe735cea2eeb4a856c2e6a82d01fd01b056f7420616772e20633e8713fa280f9271ff0532a6705921604834d8959daf3354197a1efe7b58a860a80dc697c58f4abac4daa4345da9298e0ef7af45853f8f4ea36102e1121ccfcabbf74cd3d39c0c5d69961405ff1e4da7576184305c97a36ce37370e4d2e7f3963ecb21411af3c0851daa9fce322963dfbb14dac7dca21466a18b22e905bfa5f9e33a2246931906cd426a8170f84f708b20ced42cec02e84fd6103ebcec35188c72c2bdda678f25775e896cd3dfb46fe82afb782093acef0d138beaab4a3087623065d281d29707ce798d1b038666c463bde2cb1d60da9097fb12ff80ade125f83ae7ef4c501b2355af8008eef9ecfe8d6a95b23a1b7fe074e7f992794d3a49c704b0640a7f4bfd77ef977dd4d7ecfd2e3fe4d00c271dab90a9eb64bb61a36fde1b2621d1bfe72f5825edb2bb2d4c236926055ec8f1d82bf502de2e3a9c76a59097523369f68dde4886865569c6f472358ab38ba11de4148cad88997c1d69b99f9100452134b7d6db7d01120fa1c07acea627c040fcb843e7f38eddaedd083b367b1dca677c835c2b4c31549721ff9caf8d96f9fdb6334d50fbabe11deca73b1e16f12b92edd44c1995c4d70f6549d807efbe4295c410e5df1e9a0c3fb827dd470543c012389822d3d8a3524926341cd49a296133ebf43896e83faa713f814203d611e42c329af46a52d6618883dc029b48b8907337011493619dcc4402330e3ed982ca1df5074137f2877d555f2d82332cf7b2e2e54ac667bed6587f39dc15cfb4950353c7581a1385273841237e1b0fcf46ebd5928306d0e30d179efecf2ad93380bf0b1d2cd72898b5ceb651b10269d1d5da75d89aeebfd28082769d0b33f410094aa4060d683302b75b3bc47f6f83df3e80e92034f11c7e1da57c73458eb1d5e6a0f73b5d5e06599193f25a7f7650960dc650381bffbd80295588c8b9624370549de65289e696d35dcadadf99c473724fbb66f33ac0c6457eb8287cf546ca0a39466ef325cac0bee749110bc1b1de3d2e4beb1917cf15f71b0a865d3c7de75303b597f22ff7ff82a7206830a3a5e213b5c39c28d4b89af988ce36c6c52e4380ecbf643fda27deb98d776c91a29af514c8adf683d9d158c022add32b42a8d9d3a17929616094a3f100ec26efe2ff5f6459ec973ced4ecbf87dc7319942d74245c2ffb480b6f73bdfa0ce1ac633ebb17b82f351686727ee822cf84325a634b720a295d36d3ccf490689a339f26fe8c7b6c77c9be3203b88cdaa2a1e834c2dfe856dc4b07e4fa376451c43dfacfcb2991b33bb0ad40229bc7b9c76f6e0475a0b94c005dcdea02e61c7f8176f785cd30cd8e1fe5431d13e520c72e5d97eda29f5db069577e2379da803f66d3b50d2b165fe19c3bb14379c6251be85f149c8df45a0f1bdd36719f36824ab59bea1abb2e13828cbdef0684c839c5cf96f7dd2cd709b4e5a0d6793050b198a205ab314ef40cdc109b635931578da46e5f778d571c865aa42e3f27ac808308cbbaa30fded89d970dbf32953c2a76d8dc9431b324308205c306092a864886f70d010701a08205b4048205b0308205ac308205a8060b2a864886f70d010c0a0102a08204fa308204f63028060a2a864886f70d010c0103301a0414415295d949df5c705c0a0cf0d667b48927e2488e02020400048204c80887d97cfcc7c61d94f4020dfde60e6dba43ddb5c15153f6697056154c13dbb2644786168e629639bd4aed3f5803c2fd65b12638d2e002ef284956b46466b763681a8d357984353ece3e2d1f0497df34c97a297220b68e41367b171455ab64f7f2cdeaa268121ae207939b5b1d1b24a334c2964dab51b5121f186ad9bfac41352b46098fe794661e162b4e2d834218f502c33097c582963dcfb918a5c38fb895681567f50950de3912cf26479d0652597a77a0f9d958227f49745b61710b32372dd2a016bd2b3f0aa320a8843c0b8e7ca6a66c72a89db87b242cbe94b0ad9423489d85a50e223c84a6306e62d9e3a28e3da4b7ff8705b0cc57b9d95bb903ba8af770d95075579a5b1d887b940b707c5fca5b9a5110805a6dbb76616e9a9100be5c9b8f45a017e3b2ad2cb3e54e33e73a33372ad68679996102117e1264146707e4035d8a3b94902b2049ee547b9cb49edb7b0af52c8c5633b7a67b75b14b6ed56c86c41027a72ad3c4a18d5cfd5045a0e46542aa337e325f79ca44cb097cdfd77b1887430e4b36a5e34e4379802930fb61ed228953a470efa2248a65feabb2281672d6aacb8a0e1ebf8aa328b6c28dfa9d36a0ef0f5924e3c068f2cf36fb6af9e4b0abb1de7863240ce958c8ceda1167353b7565738363d5a56c5ef49302b3f36865bbaaa48023a5b54e6e92aff8339c6d47e8da0585b25e5626a226c06318ca49a86b0a39d5e82a4382ec743d49552bdebc4441032fa17c6fe7847eeca5aeda1cfe1b7883fc8ed5bb2a21d066f1f7135805d777e5eeb59f13cc84b9535c7bdd1246db02141bf3e2fdd46604dd932dc43f9b62bb0798e2947a19558d080ce4f65754f3154ad68c0900e94f8868407e042601c487510c8ae275d9b59c50d05a43ace9775b262f24f0a48bfa57387171d0113b28ca1aaab3f8184c64c05003635210672eff223d3863b640b9aab57dc022278b72d020ae3d1371db2f991bafbc2710d0f3d291ab1fff703b1e6533c5783720849c163e4e2dbc3514731b577f4c60a7c94745e8c3808cb2c2a9dd4b60e022a35b3ad2d4eb9b62a2d1e60bdb60d678f9723e744a1a79575b0a6af811c5e51226968c3f4acd14c7158886916ea0af58164691f76e7a5e8ebee24f31b0342120577b842a747624208e3631ca1e878d35e7eb95aaab83c2e3c1cb9be1219e1c92ac139ebdaed01695f765acf6508d3d66e1fbefe3e1bb91b73ab6ec1bcab90367ef09f6f8451a40aa976d94e0a2e8845139d9f7764b710b2b4a2811a77d00df4b5eddb6fd2640321515a30b34a66441b0d390c031f1300f5811ef8845d1af5b3bba96a8e402ec0dccc091bbae210b5ce690cd465e657058a56e8fbb75656bbcde0cba13793cbbddda3248adcaba16a9c0bc6a233b55e48be2b0f3bfde98cff235303a8973876bc7919b15c765553990db701c3ce15a797b556b0fac944d1def14c037f6ae54d035835b9b6bb64078d74594887d1b70d1b6880b227243a697f9bd4dd4dc9a890c9df024757f9d60e62c1cb227df0505f183315f9a6ca15479479789573bcc808be036b01e0ccd171d4db4938cf606d62e3f38147773ac41b3e2efce29431a78214f185d576abc9beefe8bbc5cf5a836fd540a50f61a35a09a321595ad7ea4dce4df2c59ecd8c4efacb819887fd40ef2e4651ad97c830f510ff5c5acf7be8d40ddcbe563c653a95c5e6f9b5d539580ca74f11831819a302306092a864886f70d0109153116041401c74f14e1ebb4d3c0f6a77208d4317bdc463818307306092a864886f70d01091431661e640054004900410047004f0020004d004f005500520041004f002000440045002000430041005200560041004c0048004f0020003000350034003900340036003100360036003300300033003700340039003800310039003100300030003000320035003400000000303d3021300906052b0e03021a05000414b4a030a22d41a28d03034ed044eee717f8e44fa4041477d166caf8a531dfae512d7b0f1aac5bbccb4b44020204000000, '12345678', '2023-05-29 17:31:35', '2023-05-29 17:31:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

CREATE TABLE `cidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cidades`
--

INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(1, '1100015', 'Alta Floresta D\'Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(2, '1100023', 'Ariquemes', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(3, '1100031', 'Cabixi', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(4, '1100049', 'Cacoal', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(5, '1100056', 'Cerejeiras', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(6, '1100064', 'Colorado do Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(7, '1100072', 'Corumbiara', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(8, '1100080', 'Costa Marques', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(9, '1100098', 'Espigao D\'Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(10, '1100106', 'Guajara-Mirim', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(11, '1100114', 'Jaru', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(12, '1100122', 'Ji-Parana', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(13, '1100130', 'Machadinho D\'Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(14, '1100148', 'Nova Brasilândia D\'Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(15, '1100155', 'Ouro Preto do Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(16, '1100189', 'Pimenta Bueno', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(17, '1100205', 'Porto Velho', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(18, '1100254', 'Presidente Medici', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(19, '1100262', 'Rio Crespo', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(20, '1100288', 'Rolim de Moura', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(21, '1100296', 'Santa Luzia D\'Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(22, '1100304', 'Vilhena', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(23, '1100320', 'Sao Miguel do Guapore', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(24, '1100338', 'Nova Mamore', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(25, '1100346', 'Alvorada D\'Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(26, '1100379', 'Alto Alegre dos Parecis', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(27, '1100403', 'Alto Paraiso', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(28, '1100452', 'Buritis', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(29, '1100502', 'Novo Horizonte do Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(30, '1100601', 'Cacaulândia', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(31, '1100700', 'Campo Novo de Rondônia', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(32, '1100809', 'Candeias do Jamari', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(33, '1100908', 'Castanheiras', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(34, '1100924', 'Chupinguaia', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(35, '1100940', 'Cujubim', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(36, '1101005', 'Governador Jorge Teixeira', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(37, '1101104', 'Itapua do Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(38, '1101203', 'Ministro Andreazza', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(39, '1101302', 'Mirante da Serra', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(40, '1101401', 'Monte Negro', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(41, '1101435', 'Nova Uniao', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(42, '1101450', 'Parecis', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(43, '1101468', 'Pimenteiras do Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(44, '1101476', 'Primavera de Rondônia', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(45, '1101484', 'Sao Felipe D\'Oeste', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(46, '1101492', 'Sao Francisco do Guapore', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(47, '1101500', 'Seringueiras', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(48, '1101559', 'Teixeiropolis', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(49, '1101609', 'Theobroma', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(50, '1101708', 'Urupa', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(51, '1101757', 'Vale do Anari', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(52, '1101807', 'Vale do Paraiso', 'RO', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(53, '1200013', 'Acrelândia', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(54, '1200054', 'Assis Brasil', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(55, '1200104', 'Brasileia', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(56, '1200138', 'Bujari', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(57, '1200179', 'Capixaba', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(58, '1200203', 'Cruzeiro do Sul', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(59, '1200252', 'Epitaciolândia', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(60, '1200302', 'Feijo', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(61, '1200328', 'Jordao', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(62, '1200336', 'Mâncio Lima', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(63, '1200344', 'Manoel Urbano', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(64, '1200351', 'Marechal Thaumaturgo', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(65, '1200385', 'Placido de Castro', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(66, '1200393', 'Porto Walter', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(67, '1200401', 'Rio Branco', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(68, '1200427', 'Rodrigues Alves', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(69, '1200435', 'Santa Rosa do Purus', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(70, '1200450', 'Senador Guiomard', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(71, '1200500', 'Sena Madureira', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(72, '1200609', 'Tarauaca', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(73, '1200708', 'Xapuri', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(74, '1200807', 'Porto Acre', 'AC', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(75, '1300029', 'Alvaraes', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(76, '1300060', 'Amatura', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(77, '1300086', 'Anama', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(78, '1300102', 'Anori', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(79, '1300144', 'Apui', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(80, '1300201', 'Atalaia do Norte', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(81, '1300300', 'Autazes', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(82, '1300409', 'Barcelos', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(83, '1300508', 'Barreirinha', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(84, '1300607', 'Benjamin Constant', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(85, '1300631', 'Beruri', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(86, '1300680', 'Boa Vista do Ramos', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(87, '1300706', 'Boca do Acre', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(88, '1300805', 'Borba', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(89, '1300839', 'Caapiranga', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(90, '1300904', 'Canutama', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(91, '1301001', 'Carauari', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(92, '1301100', 'Careiro', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(93, '1301159', 'Careiro da Varzea', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(94, '1301209', 'Coari', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(95, '1301308', 'Codajas', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(96, '1301407', 'Eirunepe', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(97, '1301506', 'Envira', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(98, '1301605', 'Fonte Boa', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(99, '1301654', 'Guajara', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(100, '1301704', 'Humaita', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(101, '1301803', 'Ipixuna', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(102, '1301852', 'Iranduba', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(103, '1301902', 'Itacoatiara', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(104, '1301951', 'Itamarati', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(105, '1302009', 'Itapiranga', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(106, '1302108', 'Japura', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(107, '1302207', 'Jurua', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(108, '1302306', 'Jutai', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(109, '1302405', 'Labrea', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(110, '1302504', 'Manacapuru', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(111, '1302553', 'Manaquiri', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(112, '1302603', 'Manaus', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(113, '1302702', 'Manicore', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(114, '1302801', 'Maraa', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(115, '1302900', 'Maues', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(116, '1303007', 'Nhamunda', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(117, '1303106', 'Nova Olinda do Norte', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(118, '1303205', 'Novo Airao', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(119, '1303304', 'Novo Aripuana', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(120, '1303403', 'Parintins', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(121, '1303502', 'Pauini', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(122, '1303536', 'Presidente Figueiredo', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(123, '1303569', 'Rio Preto da Eva', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(124, '1303601', 'Santa Isabel do Rio Negro', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(125, '1303700', 'Santo Antônio do Iça', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(126, '1303809', 'Sao Gabriel da Cachoeira', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(127, '1303908', 'Sao Paulo de Olivença', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(128, '1303957', 'Sao Sebastiao do Uatuma', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(129, '1304005', 'Silves', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(130, '1304062', 'Tabatinga', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(131, '1304104', 'Tapaua', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(132, '1304203', 'Tefe', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(133, '1304237', 'Tonantins', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(134, '1304260', 'Uarini', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(135, '1304302', 'Urucara', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(136, '1304401', 'Urucurituba', 'AM', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(137, '1400027', 'Amajari', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(138, '1400050', 'Alto Alegre', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(139, '1400100', 'Boa Vista', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(140, '1400159', 'Bonfim', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(141, '1400175', 'Canta', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(142, '1400209', 'Caracarai', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(143, '1400233', 'Caroebe', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(144, '1400282', 'Iracema', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(145, '1400308', 'Mucajai', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(146, '1400407', 'Normandia', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(147, '1400456', 'Pacaraima', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(148, '1400472', 'Rorainopolis', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(149, '1400506', 'Sao Joao da Baliza', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(150, '1400605', 'Sao Luiz', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(151, '1400704', 'Uiramuta', 'RR', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(152, '1500107', 'Abaetetuba', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(153, '1500131', 'Abel Figueiredo', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(154, '1500206', 'Acara', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(155, '1500305', 'Afua', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(156, '1500347', 'agua Azul do Norte', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(157, '1500404', 'Alenquer', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(158, '1500503', 'Almeirim', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(159, '1500602', 'Altamira', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(160, '1500701', 'Anajas', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(161, '1500800', 'Ananindeua', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(162, '1500859', 'Anapu', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(163, '1500909', 'Augusto Corrêa', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(164, '1500958', 'Aurora do Para', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(165, '1501006', 'Aveiro', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(166, '1501105', 'Bagre', 'PA', '2023-05-05 12:53:20', '2023-05-05 12:53:20'),
(167, '1501204', 'Baiao', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(168, '1501253', 'Bannach', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(169, '1501303', 'Barcarena', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(170, '1501402', 'Belem', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(171, '1501451', 'Belterra', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(172, '1501501', 'Benevides', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(173, '1501576', 'Bom Jesus do Tocantins', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(174, '1501600', 'Bonito', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(175, '1501709', 'Bragança', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(176, '1501725', 'Brasil Novo', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(177, '1501758', 'Brejo Grande do Araguaia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(178, '1501782', 'Breu Branco', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(179, '1501808', 'Breves', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(180, '1501907', 'Bujaru', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(181, '1501956', 'Cachoeira do Piria', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(182, '1502004', 'Cachoeira do Arari', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(183, '1502103', 'Cameta', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(184, '1502152', 'Canaa dos Carajas', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(185, '1502202', 'Capanema', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(186, '1502301', 'Capitao Poço', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(187, '1502400', 'Castanhal', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(188, '1502509', 'Chaves', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(189, '1502608', 'Colares', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(190, '1502707', 'Conceiçao do Araguaia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(191, '1502756', 'Concordia do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(192, '1502764', 'Cumaru do Norte', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(193, '1502772', 'Curionopolis', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(194, '1502806', 'Curralinho', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(195, '1502855', 'Curua', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(196, '1502905', 'Curuça', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(197, '1502939', 'Dom Eliseu', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(198, '1502954', 'Eldorado dos Carajas', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(199, '1503002', 'Faro', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(200, '1503044', 'Floresta do Araguaia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(201, '1503077', 'Garrafao do Norte', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(202, '1503093', 'Goianesia do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(203, '1503101', 'Gurupa', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(204, '1503200', 'Igarape-Açu', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(205, '1503309', 'Igarape-Miri', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(206, '1503408', 'Inhangapi', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(207, '1503457', 'Ipixuna do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(208, '1503507', 'Irituia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(209, '1503606', 'Itaituba', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(210, '1503705', 'Itupiranga', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(211, '1503754', 'Jacareacanga', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(212, '1503804', 'Jacunda', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(213, '1503903', 'Juruti', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(214, '1504000', 'Limoeiro do Ajuru', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(215, '1504059', 'Mae do Rio', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(216, '1504109', 'Magalhaes Barata', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(217, '1504208', 'Maraba', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(218, '1504307', 'Maracana', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(219, '1504406', 'Marapanim', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(220, '1504422', 'Marituba', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(221, '1504455', 'Medicilândia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(222, '1504505', 'Melgaço', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(223, '1504604', 'Mocajuba', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(224, '1504703', 'Moju', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(225, '1504752', 'Mojui dos Campos', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(226, '1504802', 'Monte Alegre', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(227, '1504901', 'Muana', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(228, '1504950', 'Nova Esperança do Piria', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(229, '1504976', 'Nova Ipixuna', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(230, '1505007', 'Nova Timboteua', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(231, '1505031', 'Novo Progresso', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(232, '1505064', 'Novo Repartimento', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(233, '1505106', 'obidos', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(234, '1505205', 'Oeiras do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(235, '1505304', 'Oriximina', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(236, '1505403', 'Ourem', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(237, '1505437', 'Ourilândia do Norte', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(238, '1505486', 'Pacaja', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(239, '1505494', 'Palestina do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(240, '1505502', 'Paragominas', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(241, '1505536', 'Parauapebas', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(242, '1505551', 'Pau D\'Arco', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(243, '1505601', 'Peixe-Boi', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(244, '1505635', 'Piçarra', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(245, '1505650', 'Placas', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(246, '1505700', 'Ponta de Pedras', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(247, '1505809', 'Portel', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(248, '1505908', 'Porto de Moz', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(249, '1506005', 'Prainha', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(250, '1506104', 'Primavera', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(251, '1506112', 'Quatipuru', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(252, '1506138', 'Redençao', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(253, '1506161', 'Rio Maria', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(254, '1506187', 'Rondon do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(255, '1506195', 'Ruropolis', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(256, '1506203', 'Salinopolis', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(257, '1506302', 'Salvaterra', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(258, '1506351', 'Santa Barbara do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(259, '1506401', 'Santa Cruz do Arari', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(260, '1506500', 'Santa Isabel do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(261, '1506559', 'Santa Luzia do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(262, '1506583', 'Santa Maria das Barreiras', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(263, '1506609', 'Santa Maria do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(264, '1506708', 'Santana do Araguaia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(265, '1506807', 'Santarem', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(266, '1506906', 'Santarem Novo', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(267, '1507003', 'Santo Antônio do Taua', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(268, '1507102', 'Sao Caetano de Odivelas', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(269, '1507151', 'Sao Domingos do Araguaia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(270, '1507201', 'Sao Domingos do Capim', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(271, '1507300', 'Sao Felix do Xingu', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(272, '1507409', 'Sao Francisco do Para', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(273, '1507458', 'Sao Geraldo do Araguaia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(274, '1507466', 'Sao Joao da Ponta', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(275, '1507474', 'Sao Joao de Pirabas', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(276, '1507508', 'Sao Joao do Araguaia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(277, '1507607', 'Sao Miguel do Guama', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(278, '1507706', 'Sao Sebastiao da Boa Vista', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(279, '1507755', 'Sapucaia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(280, '1507805', 'Senador Jose Porfirio', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(281, '1507904', 'Soure', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(282, '1507953', 'Tailândia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(283, '1507961', 'Terra Alta', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(284, '1507979', 'Terra Santa', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(285, '1508001', 'Tome-Açu', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(286, '1508035', 'Tracuateua', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(287, '1508050', 'Trairao', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(288, '1508084', 'Tucuma', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(289, '1508100', 'Tucurui', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(290, '1508126', 'Ulianopolis', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(291, '1508159', 'Uruara', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(292, '1508209', 'Vigia', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(293, '1508308', 'Viseu', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(294, '1508357', 'Vitoria do Xingu', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(295, '1508407', 'Xinguara', 'PA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(296, '1600055', 'Serra do Navio', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(297, '1600105', 'Amapa', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(298, '1600154', 'Pedra Branca do Amapari', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(299, '1600204', 'Calçoene', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(300, '1600212', 'Cutias', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(301, '1600238', 'Ferreira Gomes', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(302, '1600253', 'Itaubal', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(303, '1600279', 'Laranjal do Jari', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(304, '1600303', 'Macapa', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(305, '1600402', 'Mazagao', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(306, '1600501', 'Oiapoque', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(307, '1600535', 'Porto Grande', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(308, '1600550', 'Pracuuba', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(309, '1600600', 'Santana', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(310, '1600709', 'Tartarugalzinho', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(311, '1600808', 'Vitoria do Jari', 'AP', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(312, '1700251', 'Abreulândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(313, '1700301', 'Aguiarnopolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(314, '1700350', 'Aliança do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(315, '1700400', 'Almas', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(316, '1700707', 'Alvorada', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(317, '1701002', 'Ananas', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(318, '1701051', 'Angico', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(319, '1701101', 'Aparecida do Rio Negro', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(320, '1701309', 'Aragominas', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(321, '1701903', 'Araguacema', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(322, '1702000', 'Araguaçu', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(323, '1702109', 'Araguaina', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(324, '1702158', 'Araguana', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(325, '1702208', 'Araguatins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(326, '1702307', 'Arapoema', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(327, '1702406', 'Arraias', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(328, '1702554', 'Augustinopolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(329, '1702703', 'Aurora do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(330, '1702901', 'Axixa do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(331, '1703008', 'Babaçulândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(332, '1703057', 'Bandeirantes do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(333, '1703073', 'Barra do Ouro', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(334, '1703107', 'Barrolândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(335, '1703206', 'Bernardo Sayao', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(336, '1703305', 'Bom Jesus do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(337, '1703602', 'Brasilândia do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(338, '1703701', 'Brejinho de Nazare', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(339, '1703800', 'Buriti do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(340, '1703826', 'Cachoeirinha', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(341, '1703842', 'Campos Lindos', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(342, '1703867', 'Cariri do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(343, '1703883', 'Carmolândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(344, '1703891', 'Carrasco Bonito', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(345, '1703909', 'Caseara', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(346, '1704105', 'Centenario', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(347, '1704600', 'Chapada de Areia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(348, '1705102', 'Chapada da Natividade', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(349, '1705508', 'Colinas do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(350, '1705557', 'Combinado', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(351, '1705607', 'Conceiçao do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(352, '1706001', 'Couto Magalhaes', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(353, '1706100', 'Cristalândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(354, '1706258', 'Crixas do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(355, '1706506', 'Darcinopolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(356, '1707009', 'Dianopolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(357, '1707108', 'Divinopolis do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(358, '1707207', 'Dois Irmaos do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(359, '1707306', 'Duere', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(360, '1707405', 'Esperantina', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(361, '1707553', 'Fatima', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(362, '1707652', 'Figueiropolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(363, '1707702', 'Filadelfia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(364, '1708205', 'Formoso do Araguaia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(365, '1708254', 'Fortaleza do Tabocao', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(366, '1708304', 'Goianorte', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(367, '1709005', 'Goiatins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(368, '1709302', 'Guarai', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(369, '1709500', 'Gurupi', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(370, '1709807', 'Ipueiras', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(371, '1710508', 'Itacaja', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(372, '1710706', 'Itaguatins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(373, '1710904', 'Itapiratins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(374, '1711100', 'Itapora do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(375, '1711506', 'Jau do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(376, '1711803', 'Juarina', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(377, '1711902', 'Lagoa da Confusao', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(378, '1711951', 'Lagoa do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(379, '1712009', 'Lajeado', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(380, '1712157', 'Lavandeira', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(381, '1712405', 'Lizarda', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(382, '1712454', 'Luzinopolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(383, '1712504', 'Marianopolis do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(384, '1712702', 'Mateiros', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(385, '1712801', 'Maurilândia do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(386, '1713205', 'Miracema do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(387, '1713304', 'Miranorte', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(388, '1713601', 'Monte do Carmo', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(389, '1713700', 'Monte Santo do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(390, '1713809', 'Palmeiras do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(391, '1713957', 'Muricilândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(392, '1714203', 'Natividade', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(393, '1714302', 'Nazare', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(394, '1714880', 'Nova Olinda', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(395, '1715002', 'Nova Rosalândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(396, '1715101', 'Novo Acordo', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(397, '1715150', 'Novo Alegre', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(398, '1715259', 'Novo Jardim', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(399, '1715507', 'Oliveira de Fatima', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(400, '1715705', 'Palmeirante', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(401, '1715754', 'Palmeiropolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(402, '1716109', 'Paraiso do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(403, '1716208', 'Parana', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(404, '1716307', 'Pau D\'Arco', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(405, '1716505', 'Pedro Afonso', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(406, '1716604', 'Peixe', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(407, '1716653', 'Pequizeiro', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(408, '1716703', 'Colmeia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(409, '1717008', 'Pindorama do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(410, '1717206', 'Piraquê', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(411, '1717503', 'Pium', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(412, '1717800', 'Ponte Alta do Bom Jesus', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(413, '1717909', 'Ponte Alta do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(414, '1718006', 'Porto Alegre do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(415, '1718204', 'Porto Nacional', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(416, '1718303', 'Praia Norte', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(417, '1718402', 'Presidente Kennedy', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(418, '1718451', 'Pugmil', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(419, '1718501', 'Recursolândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(420, '1718550', 'Riachinho', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(421, '1718659', 'Rio da Conceiçao', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(422, '1718709', 'Rio dos Bois', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(423, '1718758', 'Rio Sono', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(424, '1718808', 'Sampaio', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(425, '1718840', 'Sandolândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(426, '1718865', 'Santa Fe do Araguaia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(427, '1718881', 'Santa Maria do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(428, '1718899', 'Santa Rita do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(429, '1718907', 'Santa Rosa do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(430, '1719004', 'Santa Tereza do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(431, '1720002', 'Santa Terezinha do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(432, '1720101', 'Sao Bento do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(433, '1720150', 'Sao Felix do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(434, '1720200', 'Sao Miguel do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(435, '1720259', 'Sao Salvador do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(436, '1720309', 'Sao Sebastiao do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(437, '1720499', 'Sao Valerio', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(438, '1720655', 'Silvanopolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(439, '1720804', 'Sitio Novo do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(440, '1720853', 'Sucupira', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(441, '1720903', 'Taguatinga', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(442, '1720937', 'Taipas do Tocantins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(443, '1720978', 'Talisma', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(444, '1721000', 'Palmas', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(445, '1721109', 'Tocantinia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(446, '1721208', 'Tocantinopolis', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(447, '1721257', 'Tupirama', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(448, '1721307', 'Tupiratins', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(449, '1722081', 'Wanderlândia', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(450, '1722107', 'Xambioa', 'TO', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(451, '2100055', 'Açailândia', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(452, '2100105', 'Afonso Cunha', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(453, '2100154', 'agua Doce do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(454, '2100204', 'Alcântara', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(455, '2100303', 'Aldeias Altas', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(456, '2100402', 'Altamira do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(457, '2100436', 'Alto Alegre do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(458, '2100477', 'Alto Alegre do Pindare', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(459, '2100501', 'Alto Parnaiba', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(460, '2100550', 'Amapa do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(461, '2100600', 'Amarante do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(462, '2100709', 'Anajatuba', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(463, '2100808', 'Anapurus', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(464, '2100832', 'Apicum-Açu', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(465, '2100873', 'Araguana', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(466, '2100907', 'Araioses', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(467, '2100956', 'Arame', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(468, '2101004', 'Arari', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(469, '2101103', 'Axixa', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(470, '2101202', 'Bacabal', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(471, '2101251', 'Bacabeira', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(472, '2101301', 'Bacuri', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(473, '2101350', 'Bacurituba', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(474, '2101400', 'Balsas', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(475, '2101509', 'Barao de Grajau', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(476, '2101608', 'Barra do Corda', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(477, '2101707', 'Barreirinhas', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(478, '2101731', 'Belagua', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(479, '2101772', 'Bela Vista do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(480, '2101806', 'Benedito Leite', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(481, '2101905', 'Bequimao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(482, '2101939', 'Bernardo do Mearim', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(483, '2101970', 'Boa Vista do Gurupi', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(484, '2102002', 'Bom Jardim', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(485, '2102036', 'Bom Jesus das Selvas', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(486, '2102077', 'Bom Lugar', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(487, '2102101', 'Brejo', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(488, '2102150', 'Brejo de Areia', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(489, '2102200', 'Buriti', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(490, '2102309', 'Buriti Bravo', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(491, '2102325', 'Buriticupu', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(492, '2102358', 'Buritirana', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(493, '2102374', 'Cachoeira Grande', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(494, '2102408', 'Cajapio', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(495, '2102507', 'Cajari', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(496, '2102556', 'Campestre do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(497, '2102606', 'Cândido Mendes', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(498, '2102705', 'Cantanhede', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(499, '2102754', 'Capinzal do Norte', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(500, '2102804', 'Carolina', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(501, '2102903', 'Carutapera', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(502, '2103000', 'Caxias', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(503, '2103109', 'Cedral', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(504, '2103125', 'Central do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(505, '2103158', 'Centro do Guilherme', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(506, '2103174', 'Centro Novo do Maranhao', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(507, '2103208', 'Chapadinha', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(508, '2103257', 'Cidelândia', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(509, '2103307', 'Codo', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(510, '2103406', 'Coelho Neto', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(511, '2103505', 'Colinas', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(512, '2103554', 'Conceiçao do Lago-Açu', 'MA', '2023-05-05 12:53:21', '2023-05-05 12:53:21'),
(513, '2103604', 'Coroata', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(514, '2103703', 'Cururupu', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(515, '2103752', 'Davinopolis', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(516, '2103802', 'Dom Pedro', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(517, '2103901', 'Duque Bacelar', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(518, '2104008', 'Esperantinopolis', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(519, '2104057', 'Estreito', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(520, '2104073', 'Feira Nova do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(521, '2104081', 'Fernando Falcao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(522, '2104099', 'Formosa da Serra Negra', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(523, '2104107', 'Fortaleza dos Nogueiras', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(524, '2104206', 'Fortuna', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(525, '2104305', 'Godofredo Viana', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(526, '2104404', 'Gonçalves Dias', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(527, '2104503', 'Governador Archer', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(528, '2104552', 'Governador Edison Lobao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(529, '2104602', 'Governador Eugênio Barros', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(530, '2104628', 'Governador Luiz Rocha', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(531, '2104651', 'Governador Newton Bello', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(532, '2104677', 'Governador Nunes Freire', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(533, '2104701', 'Graça Aranha', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(534, '2104800', 'Grajau', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(535, '2104909', 'Guimaraes', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(536, '2105005', 'Humberto de Campos', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(537, '2105104', 'Icatu', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(538, '2105153', 'Igarape do Meio', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(539, '2105203', 'Igarape Grande', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(540, '2105302', 'Imperatriz', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(541, '2105351', 'Itaipava do Grajau', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(542, '2105401', 'Itapecuru Mirim', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(543, '2105427', 'Itinga do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(544, '2105450', 'Jatoba', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(545, '2105476', 'Jenipapo dos Vieiras', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(546, '2105500', 'Joao Lisboa', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(547, '2105609', 'Joselândia', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(548, '2105658', 'Junco do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(549, '2105708', 'Lago da Pedra', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(550, '2105807', 'Lago do Junco', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(551, '2105906', 'Lago Verde', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(552, '2105922', 'Lagoa do Mato', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(553, '2105948', 'Lago dos Rodrigues', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(554, '2105963', 'Lagoa Grande do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(555, '2105989', 'Lajeado Novo', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(556, '2106003', 'Lima Campos', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(557, '2106102', 'Loreto', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(558, '2106201', 'Luis Domingues', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(559, '2106300', 'Magalhaes de Almeida', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(560, '2106326', 'Maracaçume', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(561, '2106359', 'Maraja do Sena', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(562, '2106375', 'Maranhaozinho', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(563, '2106409', 'Mata Roma', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(564, '2106508', 'Matinha', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(565, '2106607', 'Matoes', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(566, '2106631', 'Matoes do Norte', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(567, '2106672', 'Milagres do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(568, '2106706', 'Mirador', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(569, '2106755', 'Miranda do Norte', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(570, '2106805', 'Mirinzal', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(571, '2106904', 'Monçao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(572, '2107001', 'Montes Altos', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(573, '2107100', 'Morros', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(574, '2107209', 'Nina Rodrigues', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(575, '2107258', 'Nova Colinas', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(576, '2107308', 'Nova Iorque', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(577, '2107357', 'Nova Olinda do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(578, '2107407', 'Olho D\'agua das Cunhas', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(579, '2107456', 'Olinda Nova do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(580, '2107506', 'Paço do Lumiar', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(581, '2107605', 'Palmeirândia', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(582, '2107704', 'Paraibano', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(583, '2107803', 'Parnarama', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(584, '2107902', 'Passagem Franca', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(585, '2108009', 'Pastos Bons', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(586, '2108058', 'Paulino Neves', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(587, '2108108', 'Paulo Ramos', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(588, '2108207', 'Pedreiras', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(589, '2108256', 'Pedro do Rosario', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(590, '2108306', 'Penalva', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(591, '2108405', 'Peri Mirim', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(592, '2108454', 'Peritoro', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(593, '2108504', 'Pindare-Mirim', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(594, '2108603', 'Pinheiro', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(595, '2108702', 'Pio XII', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(596, '2108801', 'Pirapemas', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(597, '2108900', 'Poçao de Pedras', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(598, '2109007', 'Porto Franco', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(599, '2109056', 'Porto Rico do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(600, '2109106', 'Presidente Dutra', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(601, '2109205', 'Presidente Juscelino', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(602, '2109239', 'Presidente Medici', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(603, '2109270', 'Presidente Sarney', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(604, '2109304', 'Presidente Vargas', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(605, '2109403', 'Primeira Cruz', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(606, '2109452', 'Raposa', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(607, '2109502', 'Riachao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(608, '2109551', 'Ribamar Fiquene', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(609, '2109601', 'Rosario', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(610, '2109700', 'Sambaiba', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(611, '2109759', 'Santa Filomena do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(612, '2109809', 'Santa Helena', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(613, '2109908', 'Santa Inês', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(614, '2110005', 'Santa Luzia', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(615, '2110039', 'Santa Luzia do Parua', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(616, '2110104', 'Santa Quiteria do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(617, '2110203', 'Santa Rita', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(618, '2110237', 'Santana do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(619, '2110278', 'Santo Amaro do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(620, '2110302', 'Santo Antônio dos Lopes', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(621, '2110401', 'Sao Benedito do Rio Preto', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(622, '2110500', 'Sao Bento', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(623, '2110609', 'Sao Bernardo', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(624, '2110658', 'Sao Domingos do Azeitao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(625, '2110708', 'Sao Domingos do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(626, '2110807', 'Sao Felix de Balsas', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(627, '2110856', 'Sao Francisco do Brejao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(628, '2110906', 'Sao Francisco do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(629, '2111003', 'Sao Joao Batista', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(630, '2111029', 'Sao Joao do Caru', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(631, '2111052', 'Sao Joao do Paraiso', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(632, '2111078', 'Sao Joao do Soter', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(633, '2111102', 'Sao Joao dos Patos', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(634, '2111201', 'Sao Jose de Ribamar', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(635, '2111250', 'Sao Jose dos Basilios', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(636, '2111300', 'Sao Luis', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(637, '2111409', 'Sao Luis Gonzaga do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(638, '2111508', 'Sao Mateus do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(639, '2111532', 'Sao Pedro da agua Branca', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(640, '2111573', 'Sao Pedro dos Crentes', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(641, '2111607', 'Sao Raimundo das Mangabeiras', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(642, '2111631', 'Sao Raimundo do Doca Bezerra', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(643, '2111672', 'Sao Roberto', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(644, '2111706', 'Sao Vicente Ferrer', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(645, '2111722', 'Satubinha', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(646, '2111748', 'Senador Alexandre Costa', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(647, '2111763', 'Senador La Rocque', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(648, '2111789', 'Serrano do Maranhao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(649, '2111805', 'Sitio Novo', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(650, '2111904', 'Sucupira do Norte', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(651, '2111953', 'Sucupira do Riachao', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(652, '2112001', 'Tasso Fragoso', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(653, '2112100', 'Timbiras', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(654, '2112209', 'Timon', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(655, '2112233', 'Trizidela do Vale', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(656, '2112274', 'Tufilândia', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(657, '2112308', 'Tuntum', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(658, '2112407', 'Turiaçu', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(659, '2112456', 'Turilândia', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(660, '2112506', 'Tutoia', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(661, '2112605', 'Urbano Santos', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(662, '2112704', 'Vargem Grande', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(663, '2112803', 'Viana', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(664, '2112852', 'Vila Nova dos Martirios', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(665, '2112902', 'Vitoria do Mearim', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(666, '2113009', 'Vitorino Freire', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(667, '2114007', 'Ze Doca', 'MA', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(668, '2200053', 'Acaua', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(669, '2200103', 'Agricolândia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(670, '2200202', 'agua Branca', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(671, '2200251', 'Alagoinha do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(672, '2200277', 'Alegrete do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(673, '2200301', 'Alto Longa', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(674, '2200400', 'Altos', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(675, '2200459', 'Alvorada do Gurgueia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(676, '2200509', 'Amarante', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(677, '2200608', 'Angical do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(678, '2200707', 'Anisio de Abreu', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(679, '2200806', 'Antônio Almeida', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(680, '2200905', 'Aroazes', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(681, '2200954', 'Aroeiras do Itaim', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(682, '2201002', 'Arraial', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(683, '2201051', 'Assunçao do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(684, '2201101', 'Avelino Lopes', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(685, '2201150', 'Baixa Grande do Ribeiro', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(686, '2201176', 'Barra D\'Alcântara', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(687, '2201200', 'Barras', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(688, '2201309', 'Barreiras do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(689, '2201408', 'Barro Duro', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(690, '2201507', 'Batalha', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(691, '2201556', 'Bela Vista do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(692, '2201572', 'Belem do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(693, '2201606', 'Beneditinos', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(694, '2201705', 'Bertolinia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(695, '2201739', 'Betânia do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(696, '2201770', 'Boa Hora', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(697, '2201804', 'Bocaina', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(698, '2201903', 'Bom Jesus', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(699, '2201919', 'Bom Principio do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(700, '2201929', 'Bonfim do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(701, '2201945', 'Boqueirao do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(702, '2201960', 'Brasileira', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(703, '2201988', 'Brejo do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(704, '2202000', 'Buriti dos Lopes', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(705, '2202026', 'Buriti dos Montes', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(706, '2202059', 'Cabeceiras do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(707, '2202075', 'Cajazeiras do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(708, '2202083', 'Cajueiro da Praia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(709, '2202091', 'Caldeirao Grande do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(710, '2202109', 'Campinas do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(711, '2202117', 'Campo Alegre do Fidalgo', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(712, '2202133', 'Campo Grande do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(713, '2202174', 'Campo Largo do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(714, '2202208', 'Campo Maior', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(715, '2202251', 'Canavieira', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(716, '2202307', 'Canto do Buriti', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(717, '2202406', 'Capitao de Campos', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(718, '2202455', 'Capitao Gervasio Oliveira', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(719, '2202505', 'Caracol', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(720, '2202539', 'Caraubas do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(721, '2202554', 'Caridade do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(722, '2202604', 'Castelo do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(723, '2202653', 'Caxingo', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(724, '2202703', 'Cocal', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(725, '2202711', 'Cocal de Telha', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(726, '2202729', 'Cocal dos Alves', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(727, '2202737', 'Coivaras', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(728, '2202752', 'Colônia do Gurgueia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(729, '2202778', 'Colônia do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(730, '2202802', 'Conceiçao do Caninde', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(731, '2202851', 'Coronel Jose Dias', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(732, '2202901', 'Corrente', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(733, '2203008', 'Cristalândia do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(734, '2203107', 'Cristino Castro', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(735, '2203206', 'Curimata', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(736, '2203230', 'Currais', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(737, '2203255', 'Curralinhos', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(738, '2203271', 'Curral Novo do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(739, '2203305', 'Demerval Lobao', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(740, '2203354', 'Dirceu Arcoverde', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(741, '2203404', 'Dom Expedito Lopes', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(742, '2203420', 'Domingos Mourao', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(743, '2203453', 'Dom Inocêncio', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(744, '2203503', 'Elesbao Veloso', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(745, '2203602', 'Eliseu Martins', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(746, '2203701', 'Esperantina', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(747, '2203750', 'Fartura do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(748, '2203800', 'Flores do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(749, '2203859', 'Floresta do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(750, '2203909', 'Floriano', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(751, '2204006', 'Francinopolis', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(752, '2204105', 'Francisco Ayres', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(753, '2204154', 'Francisco Macedo', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(754, '2204204', 'Francisco Santos', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(755, '2204303', 'Fronteiras', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(756, '2204352', 'Geminiano', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(757, '2204402', 'Gilbues', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(758, '2204501', 'Guadalupe', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(759, '2204550', 'Guaribas', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(760, '2204600', 'Hugo Napoleao', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(761, '2204659', 'Ilha Grande', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(762, '2204709', 'Inhuma', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(763, '2204808', 'Ipiranga do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(764, '2204907', 'Isaias Coelho', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(765, '2205003', 'Itainopolis', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(766, '2205102', 'Itaueira', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(767, '2205151', 'Jacobina do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(768, '2205201', 'Jaicos', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(769, '2205250', 'Jardim do Mulato', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(770, '2205276', 'Jatoba do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(771, '2205300', 'Jerumenha', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(772, '2205359', 'Joao Costa', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(773, '2205409', 'Joaquim Pires', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(774, '2205458', 'Joca Marques', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(775, '2205508', 'Jose de Freitas', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(776, '2205516', 'Juazeiro do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(777, '2205524', 'Julio Borges', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(778, '2205532', 'Jurema', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(779, '2205540', 'Lagoinha do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(780, '2205557', 'Lagoa Alegre', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(781, '2205565', 'Lagoa do Barro do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(782, '2205573', 'Lagoa de Sao Francisco', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(783, '2205581', 'Lagoa do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(784, '2205599', 'Lagoa do Sitio', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(785, '2205607', 'Landri Sales', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(786, '2205706', 'Luis Correia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(787, '2205805', 'Luzilândia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(788, '2205854', 'Madeiro', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(789, '2205904', 'Manoel Emidio', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(790, '2205953', 'Marcolândia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(791, '2206001', 'Marcos Parente', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(792, '2206050', 'Massapê do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(793, '2206100', 'Matias Olimpio', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(794, '2206209', 'Miguel Alves', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(795, '2206308', 'Miguel Leao', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(796, '2206357', 'Milton Brandao', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(797, '2206407', 'Monsenhor Gil', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(798, '2206506', 'Monsenhor Hipolito', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(799, '2206605', 'Monte Alegre do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(800, '2206654', 'Morro Cabeça no Tempo', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(801, '2206670', 'Morro do Chapeu do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(802, '2206696', 'Murici dos Portelas', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(803, '2206704', 'Nazare do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(804, '2206720', 'Nazaria', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(805, '2206753', 'Nossa Senhora de Nazare', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(806, '2206803', 'Nossa Senhora dos Remedios', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(807, '2206902', 'Novo Oriente do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(808, '2206951', 'Novo Santo Antônio', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(809, '2207009', 'Oeiras', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(810, '2207108', 'Olho D\'agua do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(811, '2207207', 'Padre Marcos', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(812, '2207306', 'Paes Landim', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(813, '2207355', 'Pajeu do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(814, '2207405', 'Palmeira do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(815, '2207504', 'Palmeirais', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(816, '2207553', 'Paqueta', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(817, '2207603', 'Parnagua', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(818, '2207702', 'Parnaiba', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(819, '2207751', 'Passagem Franca do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(820, '2207777', 'Patos do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(821, '2207793', 'Pau D\'Arco do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(822, '2207801', 'Paulistana', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(823, '2207850', 'Pavussu', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(824, '2207900', 'Pedro II', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(825, '2207934', 'Pedro Laurentino', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(826, '2207959', 'Nova Santa Rita', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(827, '2208007', 'Picos', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(828, '2208106', 'Pimenteiras', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(829, '2208205', 'Pio IX', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(830, '2208304', 'Piracuruca', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(831, '2208403', 'Piripiri', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(832, '2208502', 'Porto', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(833, '2208551', 'Porto Alegre do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(834, '2208601', 'Prata do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(835, '2208650', 'Queimada Nova', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(836, '2208700', 'Redençao do Gurgueia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(837, '2208809', 'Regeneraçao', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(838, '2208858', 'Riacho Frio', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(839, '2208874', 'Ribeira do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(840, '2208908', 'Ribeiro Gonçalves', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(841, '2209005', 'Rio Grande do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(842, '2209104', 'Santa Cruz do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(843, '2209153', 'Santa Cruz dos Milagres', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(844, '2209203', 'Santa Filomena', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(845, '2209302', 'Santa Luz', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(846, '2209351', 'Santana do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(847, '2209377', 'Santa Rosa do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(848, '2209401', 'Santo Antônio de Lisboa', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(849, '2209450', 'Santo Antônio dos Milagres', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(850, '2209500', 'Santo Inacio do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(851, '2209559', 'Sao Braz do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(852, '2209609', 'Sao Felix do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(853, '2209658', 'Sao Francisco de Assis do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(854, '2209708', 'Sao Francisco do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(855, '2209757', 'Sao Gonçalo do Gurgueia', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(856, '2209807', 'Sao Gonçalo do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(857, '2209856', 'Sao Joao da Canabrava', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(858, '2209872', 'Sao Joao da Fronteira', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(859, '2209906', 'Sao Joao da Serra', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(860, '2209955', 'Sao Joao da Varjota', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(861, '2209971', 'Sao Joao do Arraial', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(862, '2210003', 'Sao Joao do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(863, '2210052', 'Sao Jose do Divino', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(864, '2210102', 'Sao Jose do Peixe', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(865, '2210201', 'Sao Jose do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(866, '2210300', 'Sao Juliao', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(867, '2210359', 'Sao Lourenço do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(868, '2210375', 'Sao Luis do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(869, '2210383', 'Sao Miguel da Baixa Grande', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(870, '2210391', 'Sao Miguel do Fidalgo', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(871, '2210409', 'Sao Miguel do Tapuio', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(872, '2210508', 'Sao Pedro do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(873, '2210607', 'Sao Raimundo Nonato', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(874, '2210623', 'Sebastiao Barros', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(875, '2210631', 'Sebastiao Leal', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(876, '2210656', 'Sigefredo Pacheco', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(877, '2210706', 'Simoes', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(878, '2210805', 'Simplicio Mendes', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(879, '2210904', 'Socorro do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(880, '2210938', 'Sussuapara', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(881, '2210953', 'Tamboril do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(882, '2210979', 'Tanque do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(883, '2211001', 'Teresina', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(884, '2211100', 'Uniao', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(885, '2211209', 'Uruçui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(886, '2211308', 'Valença do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(887, '2211357', 'Varzea Branca', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(888, '2211407', 'Varzea Grande', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(889, '2211506', 'Vera Mendes', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(890, '2211605', 'Vila Nova do Piaui', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(891, '2211704', 'Wall Ferraz', 'PI', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(892, '2300101', 'Abaiara', 'CE', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(893, '2300150', 'Acarape', 'CE', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(894, '2300200', 'Acarau', 'CE', '2023-05-05 12:53:22', '2023-05-05 12:53:22'),
(895, '2300309', 'Acopiara', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(896, '2300408', 'Aiuaba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(897, '2300507', 'Alcântaras', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(898, '2300606', 'Altaneira', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(899, '2300705', 'Alto Santo', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(900, '2300754', 'Amontada', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(901, '2300804', 'Antonina do Norte', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(902, '2300903', 'Apuiares', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(903, '2301000', 'Aquiraz', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(904, '2301109', 'Aracati', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(905, '2301208', 'Aracoiaba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(906, '2301257', 'Ararenda', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(907, '2301307', 'Araripe', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(908, '2301406', 'Aratuba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(909, '2301505', 'Arneiroz', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(910, '2301604', 'Assare', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(911, '2301703', 'Aurora', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(912, '2301802', 'Baixio', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(913, '2301851', 'Banabuiu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(914, '2301901', 'Barbalha', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(915, '2301950', 'Barreira', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(916, '2302008', 'Barro', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(917, '2302057', 'Barroquinha', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(918, '2302107', 'Baturite', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(919, '2302206', 'Beberibe', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(920, '2302305', 'Bela Cruz', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(921, '2302404', 'Boa Viagem', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(922, '2302503', 'Brejo Santo', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(923, '2302602', 'Camocim', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(924, '2302701', 'Campos Sales', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(925, '2302800', 'Caninde', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(926, '2302909', 'Capistrano', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(927, '2303006', 'Caridade', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(928, '2303105', 'Carire', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(929, '2303204', 'Caririaçu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(930, '2303303', 'Carius', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(931, '2303402', 'Carnaubal', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(932, '2303501', 'Cascavel', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(933, '2303600', 'Catarina', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(934, '2303659', 'Catunda', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(935, '2303709', 'Caucaia', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(936, '2303808', 'Cedro', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(937, '2303907', 'Chaval', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(938, '2303931', 'Choro', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(939, '2303956', 'Chorozinho', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(940, '2304004', 'Coreau', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(941, '2304103', 'Crateus', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(942, '2304202', 'Crato', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(943, '2304236', 'Croata', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(944, '2304251', 'Cruz', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(945, '2304269', 'Deputado Irapuan Pinheiro', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(946, '2304277', 'Ererê', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(947, '2304285', 'Eusebio', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(948, '2304301', 'Farias Brito', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(949, '2304350', 'Forquilha', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(950, '2304400', 'Fortaleza', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(951, '2304459', 'Fortim', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(952, '2304509', 'Frecheirinha', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(953, '2304608', 'General Sampaio', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(954, '2304657', 'Graça', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(955, '2304707', 'Granja', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(956, '2304806', 'Granjeiro', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(957, '2304905', 'Groairas', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(958, '2304954', 'Guaiuba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(959, '2305001', 'Guaraciaba do Norte', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(960, '2305100', 'Guaramiranga', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(961, '2305209', 'Hidrolândia', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(962, '2305233', 'Horizonte', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(963, '2305266', 'Ibaretama', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(964, '2305308', 'Ibiapina', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(965, '2305332', 'Ibicuitinga', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(966, '2305357', 'Icapui', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(967, '2305407', 'Ico', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(968, '2305506', 'Iguatu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(969, '2305605', 'Independência', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(970, '2305654', 'Ipaporanga', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(971, '2305704', 'Ipaumirim', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(972, '2305803', 'Ipu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(973, '2305902', 'Ipueiras', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(974, '2306009', 'Iracema', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(975, '2306108', 'Irauçuba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(976, '2306207', 'Itaiçaba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(977, '2306256', 'Itaitinga', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(978, '2306306', 'Itapage', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(979, '2306405', 'Itapipoca', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(980, '2306504', 'Itapiuna', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(981, '2306553', 'Itarema', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(982, '2306603', 'Itatira', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(983, '2306702', 'Jaguaretama', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(984, '2306801', 'Jaguaribara', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(985, '2306900', 'Jaguaribe', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(986, '2307007', 'Jaguaruana', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(987, '2307106', 'Jardim', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(988, '2307205', 'Jati', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(989, '2307254', 'Jijoca de Jericoacoara', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(990, '2307304', 'Juazeiro do Norte', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(991, '2307403', 'Jucas', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(992, '2307502', 'Lavras da Mangabeira', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(993, '2307601', 'Limoeiro do Norte', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(994, '2307635', 'Madalena', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(995, '2307650', 'Maracanau', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(996, '2307700', 'Maranguape', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(997, '2307809', 'Marco', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(998, '2307908', 'Martinopole', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(999, '2308005', 'Massapê', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1000, '2308104', 'Mauriti', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1001, '2308203', 'Meruoca', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1002, '2308302', 'Milagres', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1003, '2308351', 'Milha', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1004, '2308377', 'Miraima', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1005, '2308401', 'Missao Velha', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1006, '2308500', 'Mombaça', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1007, '2308609', 'Monsenhor Tabosa', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1008, '2308708', 'Morada Nova', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1009, '2308807', 'Moraujo', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1010, '2308906', 'Morrinhos', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1011, '2309003', 'Mucambo', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1012, '2309102', 'Mulungu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1013, '2309201', 'Nova Olinda', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1014, '2309300', 'Nova Russas', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1015, '2309409', 'Novo Oriente', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1016, '2309458', 'Ocara', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1017, '2309508', 'Oros', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1018, '2309607', 'Pacajus', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1019, '2309706', 'Pacatuba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1020, '2309805', 'Pacoti', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1021, '2309904', 'Pacuja', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1022, '2310001', 'Palhano', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1023, '2310100', 'Palmacia', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1024, '2310209', 'Paracuru', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1025, '2310258', 'Paraipaba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1026, '2310308', 'Parambu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1027, '2310407', 'Paramoti', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1028, '2310506', 'Pedra Branca', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1029, '2310605', 'Penaforte', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1030, '2310704', 'Pentecoste', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1031, '2310803', 'Pereiro', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1032, '2310852', 'Pindoretama', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1033, '2310902', 'Piquet Carneiro', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1034, '2310951', 'Pires Ferreira', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1035, '2311009', 'Poranga', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1036, '2311108', 'Porteiras', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1037, '2311207', 'Potengi', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1038, '2311231', 'Potiretama', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1039, '2311264', 'Quiterianopolis', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1040, '2311306', 'Quixada', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1041, '2311355', 'Quixelô', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1042, '2311405', 'Quixeramobim', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1043, '2311504', 'Quixere', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1044, '2311603', 'Redençao', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1045, '2311702', 'Reriutaba', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1046, '2311801', 'Russas', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1047, '2311900', 'Saboeiro', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1048, '2311959', 'Salitre', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1049, '2312007', 'Santana do Acarau', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1050, '2312106', 'Santana do Cariri', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1051, '2312205', 'Santa Quiteria', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1052, '2312304', 'Sao Benedito', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1053, '2312403', 'Sao Gonçalo do Amarante', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1054, '2312502', 'Sao Joao do Jaguaribe', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1055, '2312601', 'Sao Luis do Curu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1056, '2312700', 'Senador Pompeu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1057, '2312809', 'Senador Sa', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1058, '2312908', 'Sobral', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1059, '2313005', 'Solonopole', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1060, '2313104', 'Tabuleiro do Norte', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1061, '2313203', 'Tamboril', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1062, '2313252', 'Tarrafas', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1063, '2313302', 'Taua', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1064, '2313351', 'Tejuçuoca', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1065, '2313401', 'Tiangua', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1066, '2313500', 'Trairi', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1067, '2313559', 'Tururu', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1068, '2313609', 'Ubajara', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1069, '2313708', 'Umari', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1070, '2313757', 'Umirim', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1071, '2313807', 'Uruburetama', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1072, '2313906', 'Uruoca', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1073, '2313955', 'Varjota', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1074, '2314003', 'Varzea Alegre', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1075, '2314102', 'Viçosa do Ceara', 'CE', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1076, '2400109', 'Acari', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1077, '2400208', 'Açu', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1078, '2400307', 'Afonso Bezerra', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1079, '2400406', 'agua Nova', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1080, '2400505', 'Alexandria', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1081, '2400604', 'Almino Afonso', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1082, '2400703', 'Alto do Rodrigues', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1083, '2400802', 'Angicos', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1084, '2400901', 'Antônio Martins', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1085, '2401008', 'Apodi', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1086, '2401107', 'Areia Branca', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1087, '2401206', 'Arês', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1088, '2401305', 'Augusto Severo', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1089, '2401404', 'Baia Formosa', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1090, '2401453', 'Barauna', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1091, '2401503', 'Barcelona', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1092, '2401602', 'Bento Fernandes', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1093, '2401651', 'Bodo', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1094, '2401701', 'Bom Jesus', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1095, '2401800', 'Brejinho', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1096, '2401859', 'Caiçara do Norte', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1097, '2401909', 'Caiçara do Rio do Vento', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1098, '2402006', 'Caico', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1099, '2402105', 'Campo Redondo', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1100, '2402204', 'Canguaretama', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1101, '2402303', 'Caraubas', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1102, '2402402', 'Carnauba dos Dantas', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1103, '2402501', 'Carnaubais', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1104, '2402600', 'Ceara-Mirim', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1105, '2402709', 'Cerro Cora', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1106, '2402808', 'Coronel Ezequiel', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1107, '2402907', 'Coronel Joao Pessoa', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1108, '2403004', 'Cruzeta', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1109, '2403103', 'Currais Novos', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1110, '2403202', 'Doutor Severiano', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1111, '2403251', 'Parnamirim', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1112, '2403301', 'Encanto', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1113, '2403400', 'Equador', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1114, '2403509', 'Espirito Santo', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1115, '2403608', 'Extremoz', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1116, '2403707', 'Felipe Guerra', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1117, '2403756', 'Fernando Pedroza', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1118, '2403806', 'Florânia', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1119, '2403905', 'Francisco Dantas', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1120, '2404002', 'Frutuoso Gomes', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1121, '2404101', 'Galinhos', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1122, '2404200', 'Goianinha', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1123, '2404309', 'Governador Dix-Sept Rosado', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1124, '2404408', 'Grossos', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1125, '2404507', 'Guamare', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1126, '2404606', 'Ielmo Marinho', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1127, '2404705', 'Ipanguaçu', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1128, '2404804', 'Ipueira', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1129, '2404853', 'Itaja', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1130, '2404903', 'Itau', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1131, '2405009', 'Jaçana', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1132, '2405108', 'Jandaira', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1133, '2405207', 'Janduis', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1134, '2405306', 'Januario Cicco', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1135, '2405405', 'Japi', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1136, '2405504', 'Jardim de Angicos', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1137, '2405603', 'Jardim de Piranhas', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1138, '2405702', 'Jardim do Serido', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1139, '2405801', 'Joao Câmara', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1140, '2405900', 'Joao Dias', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1141, '2406007', 'Jose da Penha', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1142, '2406106', 'Jucurutu', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1143, '2406155', 'Jundia', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1144, '2406205', 'Lagoa D\'Anta', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1145, '2406304', 'Lagoa de Pedras', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1146, '2406403', 'Lagoa de Velhos', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1147, '2406502', 'Lagoa Nova', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1148, '2406601', 'Lagoa Salgada', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1149, '2406700', 'Lajes', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1150, '2406809', 'Lajes Pintadas', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1151, '2406908', 'Lucrecia', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1152, '2407005', 'Luis Gomes', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1153, '2407104', 'Macaiba', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1154, '2407203', 'Macau', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1155, '2407252', 'Major Sales', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1156, '2407302', 'Marcelino Vieira', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1157, '2407401', 'Martins', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1158, '2407500', 'Maxaranguape', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1159, '2407609', 'Messias Targino', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1160, '2407708', 'Montanhas', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1161, '2407807', 'Monte Alegre', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1162, '2407906', 'Monte das Gameleiras', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1163, '2408003', 'Mossoro', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1164, '2408102', 'Natal', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1165, '2408201', 'Nisia Floresta', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1166, '2408300', 'Nova Cruz', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1167, '2408409', 'Olho-D\'agua do Borges', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1168, '2408508', 'Ouro Branco', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1169, '2408607', 'Parana', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1170, '2408706', 'Parau', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1171, '2408805', 'Parazinho', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1172, '2408904', 'Parelhas', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1173, '2408953', 'Rio do Fogo', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1174, '2409100', 'Passa e Fica', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1175, '2409209', 'Passagem', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1176, '2409308', 'Patu', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1177, '2409332', 'Santa Maria', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1178, '2409407', 'Pau dos Ferros', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1179, '2409506', 'Pedra Grande', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1180, '2409605', 'Pedra Preta', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1181, '2409704', 'Pedro Avelino', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1182, '2409803', 'Pedro Velho', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(1183, '2409902', 'Pendências', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1184, '2410009', 'Piloes', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1185, '2410108', 'Poço Branco', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1186, '2410207', 'Portalegre', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1187, '2410256', 'Porto do Mangue', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1188, '2410306', 'Presidente Juscelino', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1189, '2410405', 'Pureza', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1190, '2410504', 'Rafael Fernandes', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1191, '2410603', 'Rafael Godeiro', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1192, '2410702', 'Riacho da Cruz', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1193, '2410801', 'Riacho de Santana', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1194, '2410900', 'Riachuelo', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1195, '2411007', 'Rodolfo Fernandes', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1196, '2411056', 'Tibau', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1197, '2411106', 'Ruy Barbosa', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1198, '2411205', 'Santa Cruz', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1199, '2411403', 'Santana do Matos', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1200, '2411429', 'Santana do Serido', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1201, '2411502', 'Santo Antônio', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1202, '2411601', 'Sao Bento do Norte', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1203, '2411700', 'Sao Bento do Trairi', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1204, '2411809', 'Sao Fernando', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1205, '2411908', 'Sao Francisco do Oeste', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1206, '2412005', 'Sao Gonçalo do Amarante', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1207, '2412104', 'Sao Joao do Sabugi', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1208, '2412203', 'Sao Jose de Mipibu', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1209, '2412302', 'Sao Jose do Campestre', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1210, '2412401', 'Sao Jose do Serido', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1211, '2412500', 'Sao Miguel', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1212, '2412559', 'Sao Miguel do Gostoso', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1213, '2412609', 'Sao Paulo do Potengi', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1214, '2412708', 'Sao Pedro', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1215, '2412807', 'Sao Rafael', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1216, '2412906', 'Sao Tome', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1217, '2413003', 'Sao Vicente', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1218, '2413102', 'Senador Eloi de Souza', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1219, '2413201', 'Senador Georgino Avelino', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1220, '2413300', 'Serra de Sao Bento', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1221, '2413359', 'Serra do Mel', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1222, '2413409', 'Serra Negra do Norte', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1223, '2413508', 'Serrinha', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1224, '2413557', 'Serrinha dos Pintos', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1225, '2413607', 'Severiano Melo', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1226, '2413706', 'Sitio Novo', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1227, '2413805', 'Taboleiro Grande', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1228, '2413904', 'Taipu', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1229, '2414001', 'Tangara', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1230, '2414100', 'Tenente Ananias', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1231, '2414159', 'Tenente Laurentino Cruz', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1232, '2414209', 'Tibau do Sul', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1233, '2414308', 'Timbauba dos Batistas', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1234, '2414407', 'Touros', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1235, '2414456', 'Triunfo Potiguar', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1236, '2414506', 'Umarizal', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1237, '2414605', 'Upanema', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1238, '2414704', 'Varzea', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1239, '2414753', 'Venha-Ver', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1240, '2414803', 'Vera Cruz', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1241, '2414902', 'Viçosa', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1242, '2415008', 'Vila Flor', 'RN', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1243, '2500106', 'agua Branca', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1244, '2500205', 'Aguiar', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1245, '2500304', 'Alagoa Grande', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1246, '2500403', 'Alagoa Nova', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1247, '2500502', 'Alagoinha', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1248, '2500536', 'Alcantil', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1249, '2500577', 'Algodao de Jandaira', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1250, '2500601', 'Alhandra', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1251, '2500700', 'Sao Joao do Rio do Peixe', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1252, '2500734', 'Amparo', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1253, '2500775', 'Aparecida', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1254, '2500809', 'Araçagi', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1255, '2500908', 'Arara', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1256, '2501005', 'Araruna', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1257, '2501104', 'Areia', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1258, '2501153', 'Areia de Baraunas', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1259, '2501203', 'Areial', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1260, '2501302', 'Aroeiras', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1261, '2501351', 'Assunçao', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1262, '2501401', 'Baia da Traiçao', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1263, '2501500', 'Bananeiras', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1264, '2501534', 'Barauna', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1265, '2501575', 'Barra de Santana', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1266, '2501609', 'Barra de Santa Rosa', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1267, '2501708', 'Barra de Sao Miguel', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1268, '2501807', 'Bayeux', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1269, '2501906', 'Belem', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1270, '2502003', 'Belem do Brejo do Cruz', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1271, '2502052', 'Bernardino Batista', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1272, '2502102', 'Boa Ventura', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1273, '2502151', 'Boa Vista', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1274, '2502201', 'Bom Jesus', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1275, '2502300', 'Bom Sucesso', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1276, '2502409', 'Bonito de Santa Fe', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1277, '2502508', 'Boqueirao', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1278, '2502607', 'Igaracy', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1279, '2502706', 'Borborema', 'PB', '2023-05-05 12:53:23', '2023-05-05 12:53:23'),
(1280, '2502805', 'Brejo do Cruz', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1281, '2502904', 'Brejo dos Santos', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1282, '2503001', 'Caapora', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1283, '2503100', 'Cabaceiras', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1284, '2503209', 'Cabedelo', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1285, '2503308', 'Cachoeira dos indios', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1286, '2503407', 'Cacimba de Areia', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1287, '2503506', 'Cacimba de Dentro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1288, '2503555', 'Cacimbas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1289, '2503605', 'Caiçara', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1290, '2503704', 'Cajazeiras', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1291, '2503753', 'Cajazeirinhas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1292, '2503803', 'Caldas Brandao', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1293, '2503902', 'Camalau', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1294, '2504009', 'Campina Grande', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1295, '2504033', 'Capim', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1296, '2504074', 'Caraubas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1297, '2504108', 'Carrapateira', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1298, '2504157', 'Casserengue', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1299, '2504207', 'Catingueira', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1300, '2504306', 'Catole do Rocha', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1301, '2504355', 'Caturite', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1302, '2504405', 'Conceiçao', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1303, '2504504', 'Condado', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1304, '2504603', 'Conde', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1305, '2504702', 'Congo', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1306, '2504801', 'Coremas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1307, '2504850', 'Coxixola', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1308, '2504900', 'Cruz do Espirito Santo', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1309, '2505006', 'Cubati', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1310, '2505105', 'Cuite', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1311, '2505204', 'Cuitegi', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1312, '2505238', 'Cuite de Mamanguape', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1313, '2505279', 'Curral de Cima', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1314, '2505303', 'Curral Velho', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1315, '2505352', 'Damiao', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1316, '2505402', 'Desterro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1317, '2505501', 'Vista Serrana', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1318, '2505600', 'Diamante', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1319, '2505709', 'Dona Inês', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1320, '2505808', 'Duas Estradas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1321, '2505907', 'Emas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1322, '2506004', 'Esperança', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1323, '2506103', 'Fagundes', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1324, '2506202', 'Frei Martinho', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1325, '2506251', 'Gado Bravo', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1326, '2506301', 'Guarabira', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1327, '2506400', 'Gurinhem', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1328, '2506509', 'Gurjao', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1329, '2506608', 'Ibiara', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1330, '2506707', 'Imaculada', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1331, '2506806', 'Inga', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1332, '2506905', 'Itabaiana', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1333, '2507002', 'Itaporanga', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1334, '2507101', 'Itapororoca', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1335, '2507200', 'Itatuba', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1336, '2507309', 'Jacarau', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1337, '2507408', 'Jerico', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1338, '2507507', 'Joao Pessoa', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1339, '2507606', 'Juarez Tavora', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1340, '2507705', 'Juazeirinho', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1341, '2507804', 'Junco do Serido', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1342, '2507903', 'Juripiranga', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1343, '2508000', 'Juru', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1344, '2508109', 'Lagoa', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1345, '2508208', 'Lagoa de Dentro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1346, '2508307', 'Lagoa Seca', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1347, '2508406', 'Lastro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1348, '2508505', 'Livramento', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1349, '2508554', 'Logradouro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1350, '2508604', 'Lucena', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1351, '2508703', 'Mae D\'agua', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1352, '2508802', 'Malta', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1353, '2508901', 'Mamanguape', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1354, '2509008', 'Manaira', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1355, '2509057', 'Marcaçao', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1356, '2509107', 'Mari', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1357, '2509156', 'Marizopolis', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1358, '2509206', 'Massaranduba', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1359, '2509305', 'Mataraca', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1360, '2509339', 'Matinhas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1361, '2509370', 'Mato Grosso', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1362, '2509396', 'Matureia', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1363, '2509404', 'Mogeiro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1364, '2509503', 'Montadas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1365, '2509602', 'Monte Horebe', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1366, '2509701', 'Monteiro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1367, '2509800', 'Mulungu', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1368, '2509909', 'Natuba', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1369, '2510006', 'Nazarezinho', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1370, '2510105', 'Nova Floresta', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1371, '2510204', 'Nova Olinda', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1372, '2510303', 'Nova Palmeira', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1373, '2510402', 'Olho D\'agua', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1374, '2510501', 'Olivedos', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1375, '2510600', 'Ouro Velho', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1376, '2510659', 'Parari', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1377, '2510709', 'Passagem', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1378, '2510808', 'Patos', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1379, '2510907', 'Paulista', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1380, '2511004', 'Pedra Branca', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1381, '2511103', 'Pedra Lavrada', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1382, '2511202', 'Pedras de Fogo', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1383, '2511301', 'Pianco', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1384, '2511400', 'Picui', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1385, '2511509', 'Pilar', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1386, '2511608', 'Piloes', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1387, '2511707', 'Piloezinhos', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1388, '2511806', 'Pirpirituba', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1389, '2511905', 'Pitimbu', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1390, '2512002', 'Pocinhos', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1391, '2512036', 'Poço Dantas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1392, '2512077', 'Poço de Jose de Moura', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1393, '2512101', 'Pombal', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1394, '2512200', 'Prata', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1395, '2512309', 'Princesa Isabel', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1396, '2512408', 'Puxinana', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1397, '2512507', 'Queimadas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1398, '2512606', 'Quixaba', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1399, '2512705', 'Remigio', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1400, '2512721', 'Pedro Regis', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1401, '2512747', 'Riachao', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1402, '2512754', 'Riachao do Bacamarte', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1403, '2512762', 'Riachao do Poço', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1404, '2512788', 'Riacho de Santo Antônio', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1405, '2512804', 'Riacho dos Cavalos', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1406, '2512903', 'Rio Tinto', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1407, '2513000', 'Salgadinho', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1408, '2513109', 'Salgado de Sao Felix', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1409, '2513158', 'Santa Cecilia', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1410, '2513208', 'Santa Cruz', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1411, '2513307', 'Santa Helena', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1412, '2513356', 'Santa Inês', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1413, '2513406', 'Santa Luzia', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1414, '2513505', 'Santana de Mangueira', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1415, '2513604', 'Santana dos Garrotes', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1416, '2513653', 'Joca Claudino', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1417, '2513703', 'Santa Rita', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1418, '2513802', 'Santa Teresinha', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1419, '2513851', 'Santo Andre', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1420, '2513901', 'Sao Bento', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1421, '2513927', 'Sao Bentinho', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1422, '2513943', 'Sao Domingos do Cariri', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1423, '2513968', 'Sao Domingos', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1424, '2513984', 'Sao Francisco', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1425, '2514008', 'Sao Joao do Cariri', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1426, '2514107', 'Sao Joao do Tigre', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1427, '2514206', 'Sao Jose da Lagoa Tapada', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1428, '2514305', 'Sao Jose de Caiana', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1429, '2514404', 'Sao Jose de Espinharas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1430, '2514453', 'Sao Jose dos Ramos', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1431, '2514503', 'Sao Jose de Piranhas', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1432, '2514552', 'Sao Jose de Princesa', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1433, '2514602', 'Sao Jose do Bonfim', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1434, '2514651', 'Sao Jose do Brejo do Cruz', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1435, '2514701', 'Sao Jose do Sabugi', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1436, '2514800', 'Sao Jose dos Cordeiros', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1437, '2514909', 'Sao Mamede', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1438, '2515005', 'Sao Miguel de Taipu', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1439, '2515104', 'Sao Sebastiao de Lagoa de Roça', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1440, '2515203', 'Sao Sebastiao do Umbuzeiro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1441, '2515302', 'Sape', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1442, '2515401', 'Sao Vicente do Serido', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1443, '2515500', 'Serra Branca', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1444, '2515609', 'Serra da Raiz', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1445, '2515708', 'Serra Grande', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1446, '2515807', 'Serra Redonda', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1447, '2515906', 'Serraria', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1448, '2515930', 'Sertaozinho', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1449, '2515971', 'Sobrado', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1450, '2516003', 'Solânea', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1451, '2516102', 'Soledade', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1452, '2516151', 'Sossêgo', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1453, '2516201', 'Sousa', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1454, '2516300', 'Sume', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1455, '2516409', 'Tacima', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1456, '2516508', 'Taperoa', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1457, '2516607', 'Tavares', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1458, '2516706', 'Teixeira', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1459, '2516755', 'Tenorio', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1460, '2516805', 'Triunfo', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1461, '2516904', 'Uirauna', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1462, '2517001', 'Umbuzeiro', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1463, '2517100', 'Varzea', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1464, '2517209', 'Vieiropolis', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1465, '2517407', 'Zabelê', 'PB', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1466, '2600054', 'Abreu e Lima', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1467, '2600104', 'Afogados da Ingazeira', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1468, '2600203', 'Afrânio', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1469, '2600302', 'Agrestina', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1470, '2600401', 'agua Preta', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1471, '2600500', 'aguas Belas', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1472, '2600609', 'Alagoinha', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1473, '2600708', 'Aliança', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1474, '2600807', 'Altinho', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1475, '2600906', 'Amaraji', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1476, '2601003', 'Angelim', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1477, '2601052', 'Araçoiaba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1478, '2601102', 'Araripina', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1479, '2601201', 'Arcoverde', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1480, '2601300', 'Barra de Guabiraba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1481, '2601409', 'Barreiros', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1482, '2601508', 'Belem de Maria', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1483, '2601607', 'Belem do Sao Francisco', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1484, '2601706', 'Belo Jardim', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1485, '2601805', 'Betânia', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1486, '2601904', 'Bezerros', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1487, '2602001', 'Bodoco', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1488, '2602100', 'Bom Conselho', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1489, '2602209', 'Bom Jardim', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1490, '2602308', 'Bonito', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1491, '2602407', 'Brejao', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1492, '2602506', 'Brejinho', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1493, '2602605', 'Brejo da Madre de Deus', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1494, '2602704', 'Buenos Aires', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1495, '2602803', 'Buique', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1496, '2602902', 'Cabo de Santo Agostinho', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1497, '2603009', 'Cabrobo', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1498, '2603108', 'Cachoeirinha', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1499, '2603207', 'Caetes', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1500, '2603306', 'Calçado', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1501, '2603405', 'Calumbi', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1502, '2603454', 'Camaragibe', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1503, '2603504', 'Camocim de Sao Felix', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1504, '2603603', 'Camutanga', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1505, '2603702', 'Canhotinho', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1506, '2603801', 'Capoeiras', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1507, '2603900', 'Carnaiba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1508, '2603926', 'Carnaubeira da Penha', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1509, '2604007', 'Carpina', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1510, '2604106', 'Caruaru', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1511, '2604155', 'Casinhas', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1512, '2604205', 'Catende', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1513, '2604304', 'Cedro', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1514, '2604403', 'Cha de Alegria', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1515, '2604502', 'Cha Grande', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1516, '2604601', 'Condado', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1517, '2604700', 'Correntes', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1518, '2604809', 'Cortês', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1519, '2604908', 'Cumaru', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1520, '2605004', 'Cupira', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1521, '2605103', 'Custodia', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1522, '2605152', 'Dormentes', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1523, '2605202', 'Escada', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1524, '2605301', 'Exu', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1525, '2605400', 'Feira Nova', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1526, '2605459', 'Fernando de Noronha', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1527, '2605509', 'Ferreiros', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1528, '2605608', 'Flores', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1529, '2605707', 'Floresta', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1530, '2605806', 'Frei Miguelinho', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1531, '2605905', 'Gameleira', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1532, '2606002', 'Garanhuns', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1533, '2606101', 'Gloria do Goita', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1534, '2606200', 'Goiana', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1535, '2606309', 'Granito', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1536, '2606408', 'Gravata', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1537, '2606507', 'Iati', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1538, '2606606', 'Ibimirim', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1539, '2606705', 'Ibirajuba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1540, '2606804', 'Igarassu', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1541, '2606903', 'Iguaraci', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1542, '2607000', 'Inaja', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1543, '2607109', 'Ingazeira', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1544, '2607208', 'Ipojuca', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1545, '2607307', 'Ipubi', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1546, '2607406', 'Itacuruba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1547, '2607505', 'Itaiba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1548, '2607604', 'Ilha de Itamaraca', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1549, '2607653', 'Itambe', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1550, '2607703', 'Itapetim', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1551, '2607752', 'Itapissuma', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1552, '2607802', 'Itaquitinga', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1553, '2607901', 'Jaboatao dos Guararapes', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1554, '2607950', 'Jaqueira', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1555, '2608008', 'Jatauba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1556, '2608057', 'Jatoba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1557, '2608107', 'Joao Alfredo', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1558, '2608206', 'Joaquim Nabuco', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1559, '2608255', 'Jucati', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1560, '2608305', 'Jupi', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1561, '2608404', 'Jurema', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1562, '2608453', 'Lagoa do Carro', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1563, '2608503', 'Lagoa de Itaenga', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1564, '2608602', 'Lagoa do Ouro', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1565, '2608701', 'Lagoa dos Gatos', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1566, '2608750', 'Lagoa Grande', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1567, '2608800', 'Lajedo', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1568, '2608909', 'Limoeiro', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1569, '2609006', 'Macaparana', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1570, '2609105', 'Machados', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1571, '2609154', 'Manari', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1572, '2609204', 'Maraial', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1573, '2609303', 'Mirandiba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1574, '2609402', 'Moreno', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1575, '2609501', 'Nazare da Mata', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1576, '2609600', 'Olinda', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1577, '2609709', 'Orobo', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1578, '2609808', 'Oroco', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1579, '2609907', 'Ouricuri', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1580, '2610004', 'Palmares', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1581, '2610103', 'Palmeirina', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1582, '2610202', 'Panelas', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1583, '2610301', 'Paranatama', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1584, '2610400', 'Parnamirim', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1585, '2610509', 'Passira', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1586, '2610608', 'Paudalho', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1587, '2610707', 'Paulista', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1588, '2610806', 'Pedra', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1589, '2610905', 'Pesqueira', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1590, '2611002', 'Petrolândia', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1591, '2611101', 'Petrolina', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1592, '2611200', 'Poçao', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1593, '2611309', 'Pombos', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1594, '2611408', 'Primavera', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1595, '2611507', 'Quipapa', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1596, '2611533', 'Quixaba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1597, '2611606', 'Recife', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1598, '2611705', 'Riacho das Almas', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1599, '2611804', 'Ribeirao', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1600, '2611903', 'Rio Formoso', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1601, '2612000', 'Saire', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1602, '2612109', 'Salgadinho', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1603, '2612208', 'Salgueiro', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1604, '2612307', 'Saloa', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1605, '2612406', 'Sanharo', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1606, '2612455', 'Santa Cruz', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1607, '2612471', 'Santa Cruz da Baixa Verde', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1608, '2612505', 'Santa Cruz do Capibaribe', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1609, '2612554', 'Santa Filomena', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1610, '2612604', 'Santa Maria da Boa Vista', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1611, '2612703', 'Santa Maria do Cambuca', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1612, '2612802', 'Santa Terezinha', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1613, '2612901', 'Sao Benedito do Sul', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1614, '2613008', 'Sao Bento do Una', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1615, '2613107', 'Sao Caitano', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1616, '2613206', 'Sao Joao', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1617, '2613305', 'Sao Joaquim do Monte', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1618, '2613404', 'Sao Jose da Coroa Grande', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1619, '2613503', 'Sao Jose do Belmonte', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1620, '2613602', 'Sao Jose do Egito', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1621, '2613701', 'Sao Lourenço da Mata', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1622, '2613800', 'Sao Vicente Ferrer', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1623, '2613909', 'Serra Talhada', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1624, '2614006', 'Serrita', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1625, '2614105', 'Sertânia', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1626, '2614204', 'Sirinhaem', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1627, '2614303', 'Moreilândia', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1628, '2614402', 'Solidao', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1629, '2614501', 'Surubim', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1630, '2614600', 'Tabira', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1631, '2614709', 'Tacaimbo', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1632, '2614808', 'Tacaratu', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1633, '2614857', 'Tamandare', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1634, '2615003', 'Taquaritinga do Norte', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1635, '2615102', 'Terezinha', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1636, '2615201', 'Terra Nova', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1637, '2615300', 'Timbauba', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1638, '2615409', 'Toritama', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1639, '2615508', 'Tracunhaem', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1640, '2615607', 'Trindade', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1641, '2615706', 'Triunfo', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1642, '2615805', 'Tupanatinga', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1643, '2615904', 'Tuparetama', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1644, '2616001', 'Venturosa', 'PE', '2023-05-05 12:53:24', '2023-05-05 12:53:24'),
(1645, '2616100', 'Verdejante', 'PE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1646, '2616183', 'Vertente do Lerio', 'PE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1647, '2616209', 'Vertentes', 'PE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1648, '2616308', 'Vicência', 'PE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1649, '2616407', 'Vitoria de Santo Antao', 'PE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1650, '2616506', 'Xexeu', 'PE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1651, '2700102', 'agua Branca', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1652, '2700201', 'Anadia', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1653, '2700300', 'Arapiraca', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1654, '2700409', 'Atalaia', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1655, '2700508', 'Barra de Santo Antônio', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1656, '2700607', 'Barra de Sao Miguel', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1657, '2700706', 'Batalha', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1658, '2700805', 'Belem', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1659, '2700904', 'Belo Monte', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1660, '2701001', 'Boca da Mata', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1661, '2701100', 'Branquinha', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1662, '2701209', 'Cacimbinhas', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1663, '2701308', 'Cajueiro', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1664, '2701357', 'Campestre', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1665, '2701407', 'Campo Alegre', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1666, '2701506', 'Campo Grande', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1667, '2701605', 'Canapi', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1668, '2701704', 'Capela', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1669, '2701803', 'Carneiros', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1670, '2701902', 'Cha Preta', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1671, '2702009', 'Coite do Noia', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1672, '2702108', 'Colônia Leopoldina', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1673, '2702207', 'Coqueiro Seco', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1674, '2702306', 'Coruripe', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1675, '2702355', 'Craibas', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1676, '2702405', 'Delmiro Gouveia', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1677, '2702504', 'Dois Riachos', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1678, '2702553', 'Estrela de Alagoas', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1679, '2702603', 'Feira Grande', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1680, '2702702', 'Feliz Deserto', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1681, '2702801', 'Flexeiras', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1682, '2702900', 'Girau do Ponciano', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1683, '2703007', 'Ibateguara', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1684, '2703106', 'Igaci', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1685, '2703205', 'Igreja Nova', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1686, '2703304', 'Inhapi', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1687, '2703403', 'Jacare dos Homens', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1688, '2703502', 'Jacuipe', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1689, '2703601', 'Japaratinga', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1690, '2703700', 'Jaramataia', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1691, '2703759', 'Jequia da Praia', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1692, '2703809', 'Joaquim Gomes', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1693, '2703908', 'Jundia', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1694, '2704005', 'Junqueiro', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1695, '2704104', 'Lagoa da Canoa', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1696, '2704203', 'Limoeiro de Anadia', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1697, '2704302', 'Maceio', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1698, '2704401', 'Major Isidoro', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1699, '2704500', 'Maragogi', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1700, '2704609', 'Maravilha', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1701, '2704708', 'Marechal Deodoro', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1702, '2704807', 'Maribondo', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1703, '2704906', 'Mar Vermelho', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1704, '2705002', 'Mata Grande', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1705, '2705101', 'Matriz de Camaragibe', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1706, '2705200', 'Messias', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1707, '2705309', 'Minador do Negrao', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1708, '2705408', 'Monteiropolis', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1709, '2705507', 'Murici', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1710, '2705606', 'Novo Lino', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1711, '2705705', 'Olho D\'agua das Flores', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1712, '2705804', 'Olho D\'agua do Casado', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1713, '2705903', 'Olho D\'agua Grande', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1714, '2706000', 'Olivença', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1715, '2706109', 'Ouro Branco', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1716, '2706208', 'Palestina', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1717, '2706307', 'Palmeira dos indios', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1718, '2706406', 'Pao de Açucar', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1719, '2706422', 'Pariconha', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1720, '2706448', 'Paripueira', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1721, '2706505', 'Passo de Camaragibe', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1722, '2706604', 'Paulo Jacinto', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1723, '2706703', 'Penedo', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1724, '2706802', 'Piaçabuçu', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1725, '2706901', 'Pilar', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1726, '2707008', 'Pindoba', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1727, '2707107', 'Piranhas', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1728, '2707206', 'Poço das Trincheiras', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1729, '2707305', 'Porto Calvo', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1730, '2707404', 'Porto de Pedras', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1731, '2707503', 'Porto Real do Colegio', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1732, '2707602', 'Quebrangulo', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1733, '2707701', 'Rio Largo', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1734, '2707800', 'Roteiro', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1735, '2707909', 'Santa Luzia do Norte', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1736, '2708006', 'Santana do Ipanema', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1737, '2708105', 'Santana do Mundau', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1738, '2708204', 'Sao Bras', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1739, '2708303', 'Sao Jose da Laje', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1740, '2708402', 'Sao Jose da Tapera', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1741, '2708501', 'Sao Luis do Quitunde', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1742, '2708600', 'Sao Miguel dos Campos', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1743, '2708709', 'Sao Miguel dos Milagres', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1744, '2708808', 'Sao Sebastiao', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1745, '2708907', 'Satuba', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1746, '2708956', 'Senador Rui Palmeira', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1747, '2709004', 'Tanque D\'Arca', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1748, '2709103', 'Taquarana', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1749, '2709152', 'Teotônio Vilela', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1750, '2709202', 'Traipu', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1751, '2709301', 'Uniao dos Palmares', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1752, '2709400', 'Viçosa', 'AL', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1753, '2800100', 'Amparo de Sao Francisco', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1754, '2800209', 'Aquidaba', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1755, '2800308', 'Aracaju', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1756, '2800407', 'Araua', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1757, '2800506', 'Areia Branca', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1758, '2800605', 'Barra dos Coqueiros', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1759, '2800670', 'Boquim', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1760, '2800704', 'Brejo Grande', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1761, '2801009', 'Campo do Brito', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1762, '2801108', 'Canhoba', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1763, '2801207', 'Caninde de Sao Francisco', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1764, '2801306', 'Capela', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1765, '2801405', 'Carira', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1766, '2801504', 'Carmopolis', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1767, '2801603', 'Cedro de Sao Joao', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1768, '2801702', 'Cristinapolis', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1769, '2801900', 'Cumbe', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1770, '2802007', 'Divina Pastora', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1771, '2802106', 'Estância', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1772, '2802205', 'Feira Nova', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1773, '2802304', 'Frei Paulo', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1774, '2802403', 'Gararu', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1775, '2802502', 'General Maynard', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(1776, '2802601', 'Gracho Cardoso', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1777, '2802700', 'Ilha das Flores', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1778, '2802809', 'Indiaroba', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1779, '2802908', 'Itabaiana', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1780, '2803005', 'Itabaianinha', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1781, '2803104', 'Itabi', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1782, '2803203', 'Itaporanga D\'Ajuda', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1783, '2803302', 'Japaratuba', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1784, '2803401', 'Japoata', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1785, '2803500', 'Lagarto', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1786, '2803609', 'Laranjeiras', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1787, '2803708', 'Macambira', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1788, '2803807', 'Malhada dos Bois', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1789, '2803906', 'Malhador', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1790, '2804003', 'Maruim', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1791, '2804102', 'Moita Bonita', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1792, '2804201', 'Monte Alegre de Sergipe', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1793, '2804300', 'Muribeca', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1794, '2804409', 'Neopolis', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1795, '2804458', 'Nossa Senhora Aparecida', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1796, '2804508', 'Nossa Senhora da Gloria', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1797, '2804607', 'Nossa Senhora das Dores', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1798, '2804706', 'Nossa Senhora de Lourdes', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1799, '2804805', 'Nossa Senhora do Socorro', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1800, '2804904', 'Pacatuba', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1801, '2805000', 'Pedra Mole', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1802, '2805109', 'Pedrinhas', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1803, '2805208', 'Pinhao', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1804, '2805307', 'Pirambu', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1805, '2805406', 'Poço Redondo', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1806, '2805505', 'Poço Verde', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1807, '2805604', 'Porto da Folha', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1808, '2805703', 'Propria', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1809, '2805802', 'Riachao do Dantas', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1810, '2805901', 'Riachuelo', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1811, '2806008', 'Ribeiropolis', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1812, '2806107', 'Rosario do Catete', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1813, '2806206', 'Salgado', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1814, '2806305', 'Santa Luzia do Itanhy', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1815, '2806404', 'Santana do Sao Francisco', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1816, '2806503', 'Santa Rosa de Lima', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1817, '2806602', 'Santo Amaro das Brotas', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1818, '2806701', 'Sao Cristovao', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1819, '2806800', 'Sao Domingos', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1820, '2806909', 'Sao Francisco', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1821, '2807006', 'Sao Miguel do Aleixo', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1822, '2807105', 'Simao Dias', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1823, '2807204', 'Siriri', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1824, '2807303', 'Telha', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1825, '2807402', 'Tobias Barreto', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1826, '2807501', 'Tomar do Geru', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1827, '2807600', 'Umbauba', 'SE', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1828, '2900108', 'Abaira', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1829, '2900207', 'Abare', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1830, '2900306', 'Acajutiba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1831, '2900355', 'Adustina', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1832, '2900405', 'agua Fria', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1833, '2900504', 'erico Cardoso', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1834, '2900603', 'Aiquara', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1835, '2900702', 'Alagoinhas', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1836, '2900801', 'Alcobaça', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1837, '2900900', 'Almadina', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1838, '2901007', 'Amargosa', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1839, '2901106', 'Amelia Rodrigues', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1840, '2901155', 'America Dourada', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1841, '2901205', 'Anage', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1842, '2901304', 'Andarai', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1843, '2901353', 'Andorinha', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1844, '2901403', 'Angical', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1845, '2901502', 'Anguera', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1846, '2901601', 'Antas', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1847, '2901700', 'Antônio Cardoso', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1848, '2901809', 'Antônio Gonçalves', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1849, '2901908', 'Apora', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1850, '2901957', 'Apuarema', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1851, '2902005', 'Aracatu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1852, '2902054', 'Araças', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1853, '2902104', 'Araci', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1854, '2902203', 'Aramari', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1855, '2902252', 'Arataca', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1856, '2902302', 'Aratuipe', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1857, '2902401', 'Aurelino Leal', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1858, '2902500', 'Baianopolis', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1859, '2902609', 'Baixa Grande', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1860, '2902658', 'Banzaê', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1861, '2902708', 'Barra', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1862, '2902807', 'Barra da Estiva', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1863, '2902906', 'Barra do Choça', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1864, '2903003', 'Barra do Mendes', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1865, '2903102', 'Barra do Rocha', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1866, '2903201', 'Barreiras', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1867, '2903235', 'Barro Alto', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1868, '2903276', 'Barrocas', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1869, '2903300', 'Barro Preto', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1870, '2903409', 'Belmonte', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1871, '2903508', 'Belo Campo', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1872, '2903607', 'Biritinga', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1873, '2903706', 'Boa Nova', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1874, '2903805', 'Boa Vista do Tupim', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1875, '2903904', 'Bom Jesus da Lapa', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1876, '2903953', 'Bom Jesus da Serra', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1877, '2904001', 'Boninal', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1878, '2904050', 'Bonito', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1879, '2904100', 'Boquira', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1880, '2904209', 'Botupora', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1881, '2904308', 'Brejoes', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1882, '2904407', 'Brejolândia', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1883, '2904506', 'Brotas de Macaubas', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1884, '2904605', 'Brumado', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1885, '2904704', 'Buerarema', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1886, '2904753', 'Buritirama', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1887, '2904803', 'Caatiba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1888, '2904852', 'Cabaceiras do Paraguaçu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1889, '2904902', 'Cachoeira', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1890, '2905008', 'Cacule', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1891, '2905107', 'Caem', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1892, '2905156', 'Caetanos', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1893, '2905206', 'Caetite', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1894, '2905305', 'Cafarnaum', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1895, '2905404', 'Cairu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1896, '2905503', 'Caldeirao Grande', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1897, '2905602', 'Camacan', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1898, '2905701', 'Camaçari', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1899, '2905800', 'Camamu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1900, '2905909', 'Campo Alegre de Lourdes', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1901, '2906006', 'Campo Formoso', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1902, '2906105', 'Canapolis', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1903, '2906204', 'Canarana', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1904, '2906303', 'Canavieiras', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1905, '2906402', 'Candeal', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1906, '2906501', 'Candeias', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1907, '2906600', 'Candiba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1908, '2906709', 'Cândido Sales', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1909, '2906808', 'Cansançao', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1910, '2906824', 'Canudos', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1911, '2906857', 'Capela do Alto Alegre', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1912, '2906873', 'Capim Grosso', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1913, '2906899', 'Caraibas', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1914, '2906907', 'Caravelas', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1915, '2907004', 'Cardeal da Silva', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1916, '2907103', 'Carinhanha', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1917, '2907202', 'Casa Nova', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1918, '2907301', 'Castro Alves', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1919, '2907400', 'Catolândia', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1920, '2907509', 'Catu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1921, '2907558', 'Caturama', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1922, '2907608', 'Central', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1923, '2907707', 'Chorrocho', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1924, '2907806', 'Cicero Dantas', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1925, '2907905', 'Cipo', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1926, '2908002', 'Coaraci', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1927, '2908101', 'Cocos', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1928, '2908200', 'Conceiçao da Feira', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1929, '2908309', 'Conceiçao do Almeida', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1930, '2908408', 'Conceiçao do Coite', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1931, '2908507', 'Conceiçao do Jacuipe', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1932, '2908606', 'Conde', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1933, '2908705', 'Condeuba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1934, '2908804', 'Contendas do Sincora', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1935, '2908903', 'Coraçao de Maria', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1936, '2909000', 'Cordeiros', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1937, '2909109', 'Coribe', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1938, '2909208', 'Coronel Joao Sa', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1939, '2909307', 'Correntina', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1940, '2909406', 'Cotegipe', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1941, '2909505', 'Cravolândia', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1942, '2909604', 'Crisopolis', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1943, '2909703', 'Cristopolis', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1944, '2909802', 'Cruz das Almas', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1945, '2909901', 'Curaça', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1946, '2910008', 'Dario Meira', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1947, '2910057', 'Dias D\'avila', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1948, '2910107', 'Dom Basilio', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1949, '2910206', 'Dom Macedo Costa', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1950, '2910305', 'Elisio Medrado', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1951, '2910404', 'Encruzilhada', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1952, '2910503', 'Entre Rios', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1953, '2910602', 'Esplanada', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1954, '2910701', 'Euclides da Cunha', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1955, '2910727', 'Eunapolis', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1956, '2910750', 'Fatima', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1957, '2910776', 'Feira da Mata', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1958, '2910800', 'Feira de Santana', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1959, '2910859', 'Filadelfia', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1960, '2910909', 'Firmino Alves', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1961, '2911006', 'Floresta Azul', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1962, '2911105', 'Formosa do Rio Preto', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1963, '2911204', 'Gandu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1964, '2911253', 'Gaviao', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1965, '2911303', 'Gentio do Ouro', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1966, '2911402', 'Gloria', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1967, '2911501', 'Gongogi', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1968, '2911600', 'Governador Mangabeira', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1969, '2911659', 'Guajeru', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1970, '2911709', 'Guanambi', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1971, '2911808', 'Guaratinga', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1972, '2911857', 'Heliopolis', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1973, '2911907', 'Iaçu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1974, '2912004', 'Ibiassucê', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1975, '2912103', 'Ibicarai', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1976, '2912202', 'Ibicoara', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1977, '2912301', 'Ibicui', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1978, '2912400', 'Ibipeba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1979, '2912509', 'Ibipitanga', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1980, '2912608', 'Ibiquera', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1981, '2912707', 'Ibirapitanga', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1982, '2912806', 'Ibirapua', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1983, '2912905', 'Ibirataia', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1984, '2913002', 'Ibitiara', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1985, '2913101', 'Ibitita', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1986, '2913200', 'Ibotirama', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1987, '2913309', 'Ichu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1988, '2913408', 'Igapora', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1989, '2913457', 'Igrapiuna', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1990, '2913507', 'Iguai', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1991, '2913606', 'Ilheus', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1992, '2913705', 'Inhambupe', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1993, '2913804', 'Ipecaeta', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1994, '2913903', 'Ipiau', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1995, '2914000', 'Ipira', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1996, '2914109', 'Ipupiara', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1997, '2914208', 'Irajuba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1998, '2914307', 'Iramaia', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(1999, '2914406', 'Iraquara', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2000, '2914505', 'Irara', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2001, '2914604', 'Irecê', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2002, '2914653', 'Itabela', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2003, '2914703', 'Itaberaba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2004, '2914802', 'Itabuna', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2005, '2914901', 'Itacare', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2006, '2915007', 'Itaete', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2007, '2915106', 'Itagi', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2008, '2915205', 'Itagiba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2009, '2915304', 'Itagimirim', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2010, '2915353', 'Itaguaçu da Bahia', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2011, '2915403', 'Itaju do Colônia', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2012, '2915502', 'Itajuipe', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2013, '2915601', 'Itamaraju', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2014, '2915700', 'Itamari', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2015, '2915809', 'Itambe', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2016, '2915908', 'Itanagra', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2017, '2916005', 'Itanhem', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2018, '2916104', 'Itaparica', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2019, '2916203', 'Itape', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2020, '2916302', 'Itapebi', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2021, '2916401', 'Itapetinga', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2022, '2916500', 'Itapicuru', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2023, '2916609', 'Itapitanga', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2024, '2916708', 'Itaquara', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2025, '2916807', 'Itarantim', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2026, '2916856', 'Itatim', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2027, '2916906', 'Itiruçu', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2028, '2917003', 'Itiuba', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2029, '2917102', 'Itororo', 'BA', '2023-05-05 12:53:25', '2023-05-05 12:53:25'),
(2030, '2917201', 'Ituaçu', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2031, '2917300', 'Itubera', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2032, '2917334', 'Iuiu', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2033, '2917359', 'Jaborandi', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2034, '2917409', 'Jacaraci', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2035, '2917508', 'Jacobina', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2036, '2917607', 'Jaguaquara', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2037, '2917706', 'Jaguarari', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2038, '2917805', 'Jaguaripe', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2039, '2917904', 'Jandaira', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2040, '2918001', 'Jequie', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2041, '2918100', 'Jeremoabo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2042, '2918209', 'Jiquiriça', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2043, '2918308', 'Jitauna', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2044, '2918357', 'Joao Dourado', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2045, '2918407', 'Juazeiro', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2046, '2918456', 'Jucuruçu', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2047, '2918506', 'Jussara', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2048, '2918555', 'Jussari', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2049, '2918605', 'Jussiape', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2050, '2918704', 'Lafaiete Coutinho', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2051, '2918753', 'Lagoa Real', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2052, '2918803', 'Laje', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2053, '2918902', 'Lajedao', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2054, '2919009', 'Lajedinho', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2055, '2919058', 'Lajedo do Tabocal', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2056, '2919108', 'Lamarao', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2057, '2919157', 'Lapao', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2058, '2919207', 'Lauro de Freitas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2059, '2919306', 'Lençois', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2060, '2919405', 'Licinio de Almeida', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2061, '2919504', 'Livramento de Nossa Senhora', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2062, '2919553', 'Luis Eduardo Magalhaes', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2063, '2919603', 'Macajuba', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2064, '2919702', 'Macarani', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2065, '2919801', 'Macaubas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2066, '2919900', 'Macurure', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2067, '2919926', 'Madre de Deus', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2068, '2919959', 'Maetinga', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2069, '2920007', 'Maiquinique', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2070, '2920106', 'Mairi', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2071, '2920205', 'Malhada', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2072, '2920304', 'Malhada de Pedras', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2073, '2920403', 'Manoel Vitorino', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2074, '2920452', 'Mansidao', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2075, '2920502', 'Maracas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2076, '2920601', 'Maragogipe', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2077, '2920700', 'Marau', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2078, '2920809', 'Marcionilio Souza', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2079, '2920908', 'Mascote', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2080, '2921005', 'Mata de Sao Joao', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2081, '2921054', 'Matina', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2082, '2921104', 'Medeiros Neto', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2083, '2921203', 'Miguel Calmon', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2084, '2921302', 'Milagres', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2085, '2921401', 'Mirangaba', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2086, '2921450', 'Mirante', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2087, '2921500', 'Monte Santo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2088, '2921609', 'Morpara', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2089, '2921708', 'Morro do Chapeu', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2090, '2921807', 'Mortugaba', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2091, '2921906', 'Mucugê', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2092, '2922003', 'Mucuri', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2093, '2922052', 'Mulungu do Morro', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2094, '2922102', 'Mundo Novo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2095, '2922201', 'Muniz Ferreira', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2096, '2922250', 'Muquem de Sao Francisco', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2097, '2922300', 'Muritiba', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2098, '2922409', 'Mutuipe', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2099, '2922508', 'Nazare', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2100, '2922607', 'Nilo Peçanha', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2101, '2922656', 'Nordestina', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2102, '2922706', 'Nova Canaa', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2103, '2922730', 'Nova Fatima', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2104, '2922755', 'Nova Ibia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2105, '2922805', 'Nova Itarana', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2106, '2922854', 'Nova Redençao', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2107, '2922904', 'Nova Soure', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2108, '2923001', 'Nova Viçosa', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2109, '2923035', 'Novo Horizonte', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2110, '2923050', 'Novo Triunfo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2111, '2923100', 'Olindina', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2112, '2923209', 'Oliveira dos Brejinhos', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2113, '2923308', 'Ouriçangas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2114, '2923357', 'Ourolândia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2115, '2923407', 'Palmas de Monte Alto', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2116, '2923506', 'Palmeiras', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2117, '2923605', 'Paramirim', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2118, '2923704', 'Paratinga', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2119, '2923803', 'Paripiranga', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2120, '2923902', 'Pau Brasil', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2121, '2924009', 'Paulo Afonso', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2122, '2924058', 'Pe de Serra', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2123, '2924108', 'Pedrao', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2124, '2924207', 'Pedro Alexandre', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2125, '2924306', 'Piata', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2126, '2924405', 'Pilao Arcado', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2127, '2924504', 'Pindai', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2128, '2924603', 'Pindobaçu', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2129, '2924652', 'Pintadas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2130, '2924678', 'Pirai do Norte', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2131, '2924702', 'Piripa', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2132, '2924801', 'Piritiba', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2133, '2924900', 'Planaltino', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2134, '2925006', 'Planalto', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2135, '2925105', 'Poçoes', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2136, '2925204', 'Pojuca', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2137, '2925253', 'Ponto Novo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2138, '2925303', 'Porto Seguro', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2139, '2925402', 'Potiragua', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2140, '2925501', 'Prado', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2141, '2925600', 'Presidente Dutra', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2142, '2925709', 'Presidente Jânio Quadros', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2143, '2925758', 'Presidente Tancredo Neves', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2144, '2925808', 'Queimadas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2145, '2925907', 'Quijingue', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2146, '2925931', 'Quixabeira', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2147, '2925956', 'Rafael Jambeiro', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2148, '2926004', 'Remanso', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2149, '2926103', 'Retirolândia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2150, '2926202', 'Riachao das Neves', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2151, '2926301', 'Riachao do Jacuipe', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2152, '2926400', 'Riacho de Santana', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2153, '2926509', 'Ribeira do Amparo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2154, '2926608', 'Ribeira do Pombal', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2155, '2926657', 'Ribeirao do Largo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2156, '2926707', 'Rio de Contas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2157, '2926806', 'Rio do Antônio', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2158, '2926905', 'Rio do Pires', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2159, '2927002', 'Rio Real', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2160, '2927101', 'Rodelas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2161, '2927200', 'Ruy Barbosa', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2162, '2927309', 'Salinas da Margarida', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2163, '2927408', 'Salvador', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2164, '2927507', 'Santa Barbara', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2165, '2927606', 'Santa Brigida', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2166, '2927705', 'Santa Cruz Cabralia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2167, '2927804', 'Santa Cruz da Vitoria', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2168, '2927903', 'Santa Inês', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2169, '2928000', 'Santaluz', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2170, '2928059', 'Santa Luzia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2171, '2928109', 'Santa Maria da Vitoria', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2172, '2928208', 'Santana', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2173, '2928307', 'Santanopolis', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2174, '2928406', 'Santa Rita de Cassia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2175, '2928505', 'Santa Teresinha', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2176, '2928604', 'Santo Amaro', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2177, '2928703', 'Santo Antônio de Jesus', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2178, '2928802', 'Santo Estêvao', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2179, '2928901', 'Sao Desiderio', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2180, '2928950', 'Sao Domingos', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2181, '2929008', 'Sao Felix', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2182, '2929057', 'Sao Felix do Coribe', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2183, '2929107', 'Sao Felipe', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2184, '2929206', 'Sao Francisco do Conde', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2185, '2929255', 'Sao Gabriel', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2186, '2929305', 'Sao Gonçalo dos Campos', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2187, '2929354', 'Sao Jose da Vitoria', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2188, '2929370', 'Sao Jose do Jacuipe', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2189, '2929404', 'Sao Miguel das Matas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2190, '2929503', 'Sao Sebastiao do Passe', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2191, '2929602', 'Sapeaçu', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2192, '2929701', 'Satiro Dias', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2193, '2929750', 'Saubara', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2194, '2929800', 'Saude', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2195, '2929909', 'Seabra', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2196, '2930006', 'Sebastiao Laranjeiras', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2197, '2930105', 'Senhor do Bonfim', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2198, '2930154', 'Serra do Ramalho', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2199, '2930204', 'Sento Se', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2200, '2930303', 'Serra Dourada', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2201, '2930402', 'Serra Preta', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2202, '2930501', 'Serrinha', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2203, '2930600', 'Serrolândia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2204, '2930709', 'Simoes Filho', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2205, '2930758', 'Sitio do Mato', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2206, '2930766', 'Sitio do Quinto', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2207, '2930774', 'Sobradinho', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2208, '2930808', 'Souto Soares', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2209, '2930907', 'Tabocas do Brejo Velho', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2210, '2931004', 'Tanhaçu', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2211, '2931053', 'Tanque Novo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2212, '2931103', 'Tanquinho', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2213, '2931202', 'Taperoa', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2214, '2931301', 'Tapiramuta', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2215, '2931350', 'Teixeira de Freitas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2216, '2931400', 'Teodoro Sampaio', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2217, '2931509', 'Teofilândia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2218, '2931608', 'Teolândia', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2219, '2931707', 'Terra Nova', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2220, '2931806', 'Tremedal', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2221, '2931905', 'Tucano', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2222, '2932002', 'Uaua', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2223, '2932101', 'Ubaira', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2224, '2932200', 'Ubaitaba', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2225, '2932309', 'Ubata', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2226, '2932408', 'Uibai', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2227, '2932457', 'Umburanas', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2228, '2932507', 'Una', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2229, '2932606', 'Urandi', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2230, '2932705', 'Uruçuca', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2231, '2932804', 'Utinga', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2232, '2932903', 'Valença', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2233, '2933000', 'Valente', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2234, '2933059', 'Varzea da Roça', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2235, '2933109', 'Varzea do Poço', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2236, '2933158', 'Varzea Nova', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2237, '2933174', 'Varzedo', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2238, '2933208', 'Vera Cruz', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2239, '2933257', 'Vereda', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2240, '2933307', 'Vitoria da Conquista', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2241, '2933406', 'Wagner', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2242, '2933455', 'Wanderley', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2243, '2933505', 'Wenceslau Guimaraes', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2244, '2933604', 'Xique-Xique', 'BA', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2245, '3100104', 'Abadia dos Dourados', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2246, '3100203', 'Abaete', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2247, '3100302', 'Abre Campo', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2248, '3100401', 'Acaiaca', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2249, '3100500', 'Açucena', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2250, '3100609', 'agua Boa', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2251, '3100708', 'agua Comprida', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2252, '3100807', 'Aguanil', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2253, '3100906', 'aguas Formosas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2254, '3101003', 'aguas Vermelhas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2255, '3101102', 'Aimores', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2256, '3101201', 'Aiuruoca', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2257, '3101300', 'Alagoa', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2258, '3101409', 'Albertina', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2259, '3101508', 'Alem Paraiba', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2260, '3101607', 'Alfenas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2261, '3101631', 'Alfredo Vasconcelos', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2262, '3101706', 'Almenara', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2263, '3101805', 'Alpercata', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2264, '3101904', 'Alpinopolis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2265, '3102001', 'Alterosa', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2266, '3102050', 'Alto Caparao', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2267, '3102100', 'Alto Rio Doce', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2268, '3102209', 'Alvarenga', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2269, '3102308', 'Alvinopolis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2270, '3102407', 'Alvorada de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2271, '3102506', 'Amparo do Serra', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2272, '3102605', 'Andradas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2273, '3102704', 'Cachoeira de Pajeu', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2274, '3102803', 'Andrelândia', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2275, '3102852', 'Angelândia', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2276, '3102902', 'Antônio Carlos', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2277, '3103009', 'Antônio Dias', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2278, '3103108', 'Antônio Prado de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2279, '3103207', 'Araçai', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2280, '3103306', 'Aracitaba', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2281, '3103405', 'Araçuai', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2282, '3103504', 'Araguari', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2283, '3103603', 'Arantina', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2284, '3103702', 'Araponga', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2285, '3103751', 'Arapora', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2286, '3103801', 'Arapua', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2287, '3103900', 'Araujos', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2288, '3104007', 'Araxa', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2289, '3104106', 'Arceburgo', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2290, '3104205', 'Arcos', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2291, '3104304', 'Areado', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2292, '3104403', 'Argirita', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2293, '3104452', 'Aricanduva', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2294, '3104502', 'Arinos', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2295, '3104601', 'Astolfo Dutra', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2296, '3104700', 'Ataleia', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2297, '3104809', 'Augusto de Lima', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2298, '3104908', 'Baependi', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2299, '3105004', 'Baldim', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2300, '3105103', 'Bambui', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2301, '3105202', 'Bandeira', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2302, '3105301', 'Bandeira do Sul', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2303, '3105400', 'Barao de Cocais', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2304, '3105509', 'Barao de Monte Alto', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2305, '3105608', 'Barbacena', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2306, '3105707', 'Barra Longa', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2307, '3105905', 'Barroso', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2308, '3106002', 'Bela Vista de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2309, '3106101', 'Belmiro Braga', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2310, '3106200', 'Belo Horizonte', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2311, '3106309', 'Belo Oriente', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2312, '3106408', 'Belo Vale', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2313, '3106507', 'Berilo', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2314, '3106606', 'Bertopolis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2315, '3106655', 'Berizal', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2316, '3106705', 'Betim', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2317, '3106804', 'Bias Fortes', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2318, '3106903', 'Bicas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2319, '3107000', 'Biquinhas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2320, '3107109', 'Boa Esperança', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2321, '3107208', 'Bocaina de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2322, '3107307', 'Bocaiuva', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2323, '3107406', 'Bom Despacho', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2324, '3107505', 'Bom Jardim de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2325, '3107604', 'Bom Jesus da Penha', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2326, '3107703', 'Bom Jesus do Amparo', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2327, '3107802', 'Bom Jesus do Galho', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2328, '3107901', 'Bom Repouso', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2329, '3108008', 'Bom Sucesso', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2330, '3108107', 'Bonfim', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2331, '3108206', 'Bonfinopolis de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2332, '3108255', 'Bonito de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2333, '3108305', 'Borda da Mata', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2334, '3108404', 'Botelhos', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2335, '3108503', 'Botumirim', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2336, '3108552', 'Brasilândia de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2337, '3108602', 'Brasilia de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2338, '3108701', 'Bras Pires', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2339, '3108800', 'Braunas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2340, '3108909', 'Brazopolis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2341, '3109006', 'Brumadinho', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2342, '3109105', 'Bueno Brandao', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2343, '3109204', 'Buenopolis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2344, '3109253', 'Bugre', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2345, '3109303', 'Buritis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2346, '3109402', 'Buritizeiro', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2347, '3109451', 'Cabeceira Grande', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2348, '3109501', 'Cabo Verde', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2349, '3109600', 'Cachoeira da Prata', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2350, '3109709', 'Cachoeira de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2351, '3109808', 'Cachoeira Dourada', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2352, '3109907', 'Caetanopolis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2353, '3110004', 'Caete', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2354, '3110103', 'Caiana', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2355, '3110202', 'Cajuri', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2356, '3110301', 'Caldas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2357, '3110400', 'Camacho', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2358, '3110509', 'Camanducaia', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2359, '3110608', 'Cambui', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2360, '3110707', 'Cambuquira', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2361, '3110806', 'Campanario', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2362, '3110905', 'Campanha', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2363, '3111002', 'Campestre', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2364, '3111101', 'Campina Verde', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2365, '3111150', 'Campo Azul', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2366, '3111200', 'Campo Belo', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2367, '3111309', 'Campo do Meio', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2368, '3111408', 'Campo Florido', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2369, '3111507', 'Campos Altos', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2370, '3111606', 'Campos Gerais', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2371, '3111705', 'Canaa', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(2372, '3111804', 'Canapolis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2373, '3111903', 'Cana Verde', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2374, '3112000', 'Candeias', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2375, '3112059', 'Cantagalo', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2376, '3112109', 'Caparao', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2377, '3112208', 'Capela Nova', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2378, '3112307', 'Capelinha', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2379, '3112406', 'Capetinga', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2380, '3112505', 'Capim Branco', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2381, '3112604', 'Capinopolis', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2382, '3112653', 'Capitao Andrade', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2383, '3112703', 'Capitao Eneas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2384, '3112802', 'Capitolio', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2385, '3112901', 'Caputira', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2386, '3113008', 'Carai', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2387, '3113107', 'Caranaiba', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2388, '3113206', 'Carandai', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2389, '3113305', 'Carangola', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2390, '3113404', 'Caratinga', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2391, '3113503', 'Carbonita', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2392, '3113602', 'Careaçu', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2393, '3113701', 'Carlos Chagas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2394, '3113800', 'Carmesia', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2395, '3113909', 'Carmo da Cachoeira', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2396, '3114006', 'Carmo da Mata', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2397, '3114105', 'Carmo de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2398, '3114204', 'Carmo do Cajuru', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2399, '3114303', 'Carmo do Paranaiba', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2400, '3114402', 'Carmo do Rio Claro', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2401, '3114501', 'Carmopolis de Minas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2402, '3114550', 'Carneirinho', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2403, '3114600', 'Carrancas', 'MG', '2023-05-05 12:53:26', '2023-05-05 12:53:26'),
(2404, '3114709', 'Carvalhopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2405, '3114808', 'Carvalhos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2406, '3114907', 'Casa Grande', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2407, '3115003', 'Cascalho Rico', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2408, '3115102', 'Cassia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2409, '3115201', 'Conceiçao da Barra de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2410, '3115300', 'Cataguases', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2411, '3115359', 'Catas Altas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2412, '3115409', 'Catas Altas da Noruega', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2413, '3115458', 'Catuji', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2414, '3115474', 'Catuti', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2415, '3115508', 'Caxambu', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2416, '3115607', 'Cedro do Abaete', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2417, '3115706', 'Central de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2418, '3115805', 'Centralina', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2419, '3115904', 'Chacara', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2420, '3116001', 'Chale', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2421, '3116100', 'Chapada do Norte', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2422, '3116159', 'Chapada Gaucha', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2423, '3116209', 'Chiador', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2424, '3116308', 'Cipotânea', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2425, '3116407', 'Claraval', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2426, '3116506', 'Claro dos Poçoes', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2427, '3116605', 'Claudio', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2428, '3116704', 'Coimbra', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2429, '3116803', 'Coluna', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2430, '3116902', 'Comendador Gomes', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2431, '3117009', 'Comercinho', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2432, '3117108', 'Conceiçao da Aparecida', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2433, '3117207', 'Conceiçao das Pedras', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2434, '3117306', 'Conceiçao das Alagoas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2435, '3117405', 'Conceiçao de Ipanema', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2436, '3117504', 'Conceiçao do Mato Dentro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2437, '3117603', 'Conceiçao do Para', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2438, '3117702', 'Conceiçao do Rio Verde', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2439, '3117801', 'Conceiçao dos Ouros', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2440, '3117836', 'Cônego Marinho', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2441, '3117876', 'Confins', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2442, '3117900', 'Congonhal', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2443, '3118007', 'Congonhas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2444, '3118106', 'Congonhas do Norte', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2445, '3118205', 'Conquista', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2446, '3118304', 'Conselheiro Lafaiete', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2447, '3118403', 'Conselheiro Pena', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2448, '3118502', 'Consolaçao', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2449, '3118601', 'Contagem', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2450, '3118700', 'Coqueiral', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2451, '3118809', 'Coraçao de Jesus', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2452, '3118908', 'Cordisburgo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2453, '3119005', 'Cordislândia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2454, '3119104', 'Corinto', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2455, '3119203', 'Coroaci', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2456, '3119302', 'Coromandel', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2457, '3119401', 'Coronel Fabriciano', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2458, '3119500', 'Coronel Murta', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2459, '3119609', 'Coronel Pacheco', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2460, '3119708', 'Coronel Xavier Chaves', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2461, '3119807', 'Corrego Danta', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2462, '3119906', 'Corrego do Bom Jesus', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2463, '3119955', 'Corrego Fundo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2464, '3120003', 'Corrego Novo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2465, '3120102', 'Couto de Magalhaes de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2466, '3120151', 'Crisolita', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2467, '3120201', 'Cristais', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2468, '3120300', 'Cristalia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2469, '3120409', 'Cristiano Otoni', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2470, '3120508', 'Cristina', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2471, '3120607', 'Crucilândia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2472, '3120706', 'Cruzeiro da Fortaleza', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2473, '3120805', 'Cruzilia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2474, '3120839', 'Cuparaque', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2475, '3120870', 'Curral de Dentro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2476, '3120904', 'Curvelo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2477, '3121001', 'Datas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2478, '3121100', 'Delfim Moreira', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2479, '3121209', 'Delfinopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2480, '3121258', 'Delta', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2481, '3121308', 'Descoberto', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2482, '3121407', 'Desterro de Entre Rios', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2483, '3121506', 'Desterro do Melo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2484, '3121605', 'Diamantina', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2485, '3121704', 'Diogo de Vasconcelos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2486, '3121803', 'Dionisio', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2487, '3121902', 'Divinesia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2488, '3122009', 'Divino', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2489, '3122108', 'Divino das Laranjeiras', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2490, '3122207', 'Divinolândia de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2491, '3122306', 'Divinopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2492, '3122355', 'Divisa Alegre', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2493, '3122405', 'Divisa Nova', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2494, '3122454', 'Divisopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2495, '3122470', 'Dom Bosco', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2496, '3122504', 'Dom Cavati', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2497, '3122603', 'Dom Joaquim', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2498, '3122702', 'Dom Silverio', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2499, '3122801', 'Dom Viçoso', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2500, '3122900', 'Dona Eusebia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2501, '3123007', 'Dores de Campos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2502, '3123106', 'Dores de Guanhaes', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2503, '3123205', 'Dores do Indaia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2504, '3123304', 'Dores do Turvo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2505, '3123403', 'Doresopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2506, '3123502', 'Douradoquara', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2507, '3123528', 'Durande', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2508, '3123601', 'Eloi Mendes', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2509, '3123700', 'Engenheiro Caldas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2510, '3123809', 'Engenheiro Navarro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2511, '3123858', 'Entre Folhas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2512, '3123908', 'Entre Rios de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2513, '3124005', 'Ervalia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2514, '3124104', 'Esmeraldas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2515, '3124203', 'Espera Feliz', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2516, '3124302', 'Espinosa', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2517, '3124401', 'Espirito Santo do Dourado', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2518, '3124500', 'Estiva', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2519, '3124609', 'Estrela Dalva', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2520, '3124708', 'Estrela do Indaia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2521, '3124807', 'Estrela do Sul', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2522, '3124906', 'Eugenopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2523, '3125002', 'Ewbank da Câmara', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2524, '3125101', 'Extrema', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2525, '3125200', 'Fama', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2526, '3125309', 'Faria Lemos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2527, '3125408', 'Felicio dos Santos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2528, '3125507', 'Sao Gonçalo do Rio Preto', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2529, '3125606', 'Felisburgo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2530, '3125705', 'Felixlândia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2531, '3125804', 'Fernandes Tourinho', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2532, '3125903', 'Ferros', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2533, '3125952', 'Fervedouro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2534, '3126000', 'Florestal', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2535, '3126109', 'Formiga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2536, '3126208', 'Formoso', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2537, '3126307', 'Fortaleza de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2538, '3126406', 'Fortuna de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2539, '3126505', 'Francisco Badaro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2540, '3126604', 'Francisco Dumont', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2541, '3126703', 'Francisco Sa', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2542, '3126752', 'Franciscopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2543, '3126802', 'Frei Gaspar', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2544, '3126901', 'Frei Inocêncio', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2545, '3126950', 'Frei Lagonegro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2546, '3127008', 'Fronteira', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2547, '3127057', 'Fronteira dos Vales', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2548, '3127073', 'Fruta de Leite', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2549, '3127107', 'Frutal', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2550, '3127206', 'Funilândia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2551, '3127305', 'Galileia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2552, '3127339', 'Gameleiras', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2553, '3127354', 'Glaucilândia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2554, '3127370', 'Goiabeira', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2555, '3127388', 'Goiana', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2556, '3127404', 'Gonçalves', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2557, '3127503', 'Gonzaga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2558, '3127602', 'Gouveia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2559, '3127701', 'Governador Valadares', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2560, '3127800', 'Grao Mogol', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2561, '3127909', 'Grupiara', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2562, '3128006', 'Guanhaes', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2563, '3128105', 'Guape', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2564, '3128204', 'Guaraciaba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2565, '3128253', 'Guaraciama', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2566, '3128303', 'Guaranesia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2567, '3128402', 'Guarani', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2568, '3128501', 'Guarara', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2569, '3128600', 'Guarda-Mor', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2570, '3128709', 'Guaxupe', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2571, '3128808', 'Guidoval', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2572, '3128907', 'Guimarânia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2573, '3129004', 'Guiricema', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2574, '3129103', 'Gurinhata', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2575, '3129202', 'Heliodora', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2576, '3129301', 'Iapu', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2577, '3129400', 'Ibertioga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2578, '3129509', 'Ibia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2579, '3129608', 'Ibiai', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2580, '3129657', 'Ibiracatu', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2581, '3129707', 'Ibiraci', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2582, '3129806', 'Ibirite', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2583, '3129905', 'Ibitiura de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2584, '3130002', 'Ibituruna', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2585, '3130051', 'Icarai de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2586, '3130101', 'Igarape', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2587, '3130200', 'Igaratinga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2588, '3130309', 'Iguatama', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2589, '3130408', 'Ijaci', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2590, '3130507', 'Ilicinea', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2591, '3130556', 'Imbe de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2592, '3130606', 'Inconfidentes', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2593, '3130655', 'Indaiabira', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2594, '3130705', 'Indianopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2595, '3130804', 'Ingai', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2596, '3130903', 'Inhapim', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2597, '3131000', 'Inhauma', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2598, '3131109', 'Inimutaba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2599, '3131158', 'Ipaba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2600, '3131208', 'Ipanema', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2601, '3131307', 'Ipatinga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2602, '3131406', 'Ipiaçu', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2603, '3131505', 'Ipuiuna', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2604, '3131604', 'Irai de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2605, '3131703', 'Itabira', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2606, '3131802', 'Itabirinha', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2607, '3131901', 'Itabirito', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2608, '3132008', 'Itacambira', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2609, '3132107', 'Itacarambi', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2610, '3132206', 'Itaguara', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2611, '3132305', 'Itaipe', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2612, '3132404', 'Itajuba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2613, '3132503', 'Itamarandiba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2614, '3132602', 'Itamarati de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2615, '3132701', 'Itambacuri', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2616, '3132800', 'Itambe do Mato Dentro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2617, '3132909', 'Itamogi', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2618, '3133006', 'Itamonte', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2619, '3133105', 'Itanhandu', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2620, '3133204', 'Itanhomi', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2621, '3133303', 'Itaobim', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2622, '3133402', 'Itapagipe', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2623, '3133501', 'Itapecerica', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2624, '3133600', 'Itapeva', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2625, '3133709', 'Itatiaiuçu', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2626, '3133758', 'Itau de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2627, '3133808', 'Itauna', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2628, '3133907', 'Itaverava', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2629, '3134004', 'Itinga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2630, '3134103', 'Itueta', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2631, '3134202', 'Ituiutaba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2632, '3134301', 'Itumirim', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2633, '3134400', 'Iturama', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2634, '3134509', 'Itutinga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2635, '3134608', 'Jaboticatubas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2636, '3134707', 'Jacinto', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2637, '3134806', 'Jacui', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2638, '3134905', 'Jacutinga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2639, '3135001', 'Jaguaraçu', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2640, '3135050', 'Jaiba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2641, '3135076', 'Jampruca', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2642, '3135100', 'Janauba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2643, '3135209', 'Januaria', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2644, '3135308', 'Japaraiba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2645, '3135357', 'Japonvar', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2646, '3135407', 'Jeceaba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2647, '3135456', 'Jenipapo de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2648, '3135506', 'Jequeri', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2649, '3135605', 'Jequitai', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2650, '3135704', 'Jequitiba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2651, '3135803', 'Jequitinhonha', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2652, '3135902', 'Jesuânia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2653, '3136009', 'Joaima', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2654, '3136108', 'Joanesia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2655, '3136207', 'Joao Monlevade', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2656, '3136306', 'Joao Pinheiro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2657, '3136405', 'Joaquim Felicio', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2658, '3136504', 'Jordânia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2659, '3136520', 'Jose Gonçalves de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2660, '3136553', 'Jose Raydan', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2661, '3136579', 'Josenopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2662, '3136603', 'Nova Uniao', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2663, '3136652', 'Juatuba', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2664, '3136702', 'Juiz de Fora', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2665, '3136801', 'Juramento', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2666, '3136900', 'Juruaia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2667, '3136959', 'Juvenilia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2668, '3137007', 'Ladainha', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2669, '3137106', 'Lagamar', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2670, '3137205', 'Lagoa da Prata', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2671, '3137304', 'Lagoa dos Patos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2672, '3137403', 'Lagoa Dourada', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2673, '3137502', 'Lagoa Formosa', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2674, '3137536', 'Lagoa Grande', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2675, '3137601', 'Lagoa Santa', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2676, '3137700', 'Lajinha', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2677, '3137809', 'Lambari', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2678, '3137908', 'Lamim', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2679, '3138005', 'Laranjal', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2680, '3138104', 'Lassance', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2681, '3138203', 'Lavras', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2682, '3138302', 'Leandro Ferreira', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2683, '3138351', 'Leme do Prado', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2684, '3138401', 'Leopoldina', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2685, '3138500', 'Liberdade', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2686, '3138609', 'Lima Duarte', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2687, '3138625', 'Limeira do Oeste', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2688, '3138658', 'Lontra', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2689, '3138674', 'Luisburgo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2690, '3138682', 'Luislândia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2691, '3138708', 'Luminarias', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2692, '3138807', 'Luz', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2693, '3138906', 'Machacalis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2694, '3139003', 'Machado', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2695, '3139102', 'Madre de Deus de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2696, '3139201', 'Malacacheta', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2697, '3139250', 'Mamonas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2698, '3139300', 'Manga', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2699, '3139409', 'Manhuaçu', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2700, '3139508', 'Manhumirim', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2701, '3139607', 'Mantena', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2702, '3139706', 'Maravilhas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2703, '3139805', 'Mar de Espanha', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2704, '3139904', 'Maria da Fe', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2705, '3140001', 'Mariana', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2706, '3140100', 'Marilac', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2707, '3140159', 'Mario Campos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2708, '3140209', 'Maripa de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2709, '3140308', 'Marlieria', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2710, '3140407', 'Marmelopolis', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2711, '3140506', 'Martinho Campos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2712, '3140530', 'Martins Soares', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2713, '3140555', 'Mata Verde', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2714, '3140605', 'Materlândia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2715, '3140704', 'Mateus Leme', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2716, '3140803', 'Matias Barbosa', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2717, '3140852', 'Matias Cardoso', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2718, '3140902', 'Matipo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2719, '3141009', 'Mato Verde', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2720, '3141108', 'Matozinhos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2721, '3141207', 'Matutina', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2722, '3141306', 'Medeiros', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2723, '3141405', 'Medina', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2724, '3141504', 'Mendes Pimentel', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2725, '3141603', 'Mercês', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2726, '3141702', 'Mesquita', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2727, '3141801', 'Minas Novas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2728, '3141900', 'Minduri', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2729, '3142007', 'Mirabela', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2730, '3142106', 'Miradouro', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2731, '3142205', 'Mirai', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2732, '3142254', 'Miravânia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2733, '3142304', 'Moeda', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2734, '3142403', 'Moema', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2735, '3142502', 'Monjolos', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2736, '3142601', 'Monsenhor Paulo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2737, '3142700', 'Montalvânia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2738, '3142809', 'Monte Alegre de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2739, '3142908', 'Monte Azul', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2740, '3143005', 'Monte Belo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2741, '3143104', 'Monte Carmelo', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2742, '3143153', 'Monte Formoso', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2743, '3143203', 'Monte Santo de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2744, '3143302', 'Montes Claros', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2745, '3143401', 'Monte Siao', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2746, '3143450', 'Montezuma', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2747, '3143500', 'Morada Nova de Minas', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2748, '3143609', 'Morro da Garça', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2749, '3143708', 'Morro do Pilar', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2750, '3143807', 'Munhoz', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2751, '3143906', 'Muriae', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2752, '3144003', 'Mutum', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2753, '3144102', 'Muzambinho', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2754, '3144201', 'Nacip Raydan', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2755, '3144300', 'Nanuque', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2756, '3144359', 'Naque', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2757, '3144375', 'Natalândia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2758, '3144409', 'Natercia', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2759, '3144508', 'Nazareno', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2760, '3144607', 'Nepomuceno', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2761, '3144656', 'Ninheira', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2762, '3144672', 'Nova Belem', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2763, '3144706', 'Nova Era', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2764, '3144805', 'Nova Lima', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2765, '3144904', 'Nova Modica', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2766, '3145000', 'Nova Ponte', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2767, '3145059', 'Nova Porteirinha', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2768, '3145109', 'Nova Resende', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2769, '3145208', 'Nova Serrana', 'MG', '2023-05-05 12:53:27', '2023-05-05 12:53:27'),
(2770, '3145307', 'Novo Cruzeiro', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2771, '3145356', 'Novo Oriente de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2772, '3145372', 'Novorizonte', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2773, '3145406', 'Olaria', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2774, '3145455', 'Olhos-D\'agua', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2775, '3145505', 'Olimpio Noronha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2776, '3145604', 'Oliveira', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2777, '3145703', 'Oliveira Fortes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2778, '3145802', 'Onça de Pitangui', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2779, '3145851', 'Oratorios', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2780, '3145877', 'Orizânia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2781, '3145901', 'Ouro Branco', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2782, '3146008', 'Ouro Fino', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2783, '3146107', 'Ouro Preto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2784, '3146206', 'Ouro Verde de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2785, '3146255', 'Padre Carvalho', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2786, '3146305', 'Padre Paraiso', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2787, '3146404', 'Paineiras', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2788, '3146503', 'Pains', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2789, '3146552', 'Pai Pedro', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2790, '3146602', 'Paiva', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2791, '3146701', 'Palma', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2792, '3146750', 'Palmopolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2793, '3146909', 'Papagaios', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2794, '3147006', 'Paracatu', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2795, '3147105', 'Para de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2796, '3147204', 'Paraguaçu', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2797, '3147303', 'Paraisopolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2798, '3147402', 'Paraopeba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2799, '3147501', 'Passabem', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2800, '3147600', 'Passa Quatro', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2801, '3147709', 'Passa Tempo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2802, '3147808', 'Passa-Vinte', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2803, '3147907', 'Passos', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2804, '3147956', 'Patis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2805, '3148004', 'Patos de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2806, '3148103', 'Patrocinio', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2807, '3148202', 'Patrocinio do Muriae', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2808, '3148301', 'Paula Cândido', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2809, '3148400', 'Paulistas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2810, '3148509', 'Pavao', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2811, '3148608', 'Peçanha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2812, '3148707', 'Pedra Azul', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2813, '3148756', 'Pedra Bonita', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2814, '3148806', 'Pedra do Anta', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2815, '3148905', 'Pedra do Indaia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2816, '3149002', 'Pedra Dourada', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2817, '3149101', 'Pedralva', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2818, '3149150', 'Pedras de Maria da Cruz', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2819, '3149200', 'Pedrinopolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2820, '3149309', 'Pedro Leopoldo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2821, '3149408', 'Pedro Teixeira', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2822, '3149507', 'Pequeri', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2823, '3149606', 'Pequi', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2824, '3149705', 'Perdigao', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2825, '3149804', 'Perdizes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2826, '3149903', 'Perdoes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2827, '3149952', 'Periquito', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2828, '3150000', 'Pescador', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2829, '3150109', 'Piau', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2830, '3150158', 'Piedade de Caratinga', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2831, '3150208', 'Piedade de Ponte Nova', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2832, '3150307', 'Piedade do Rio Grande', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2833, '3150406', 'Piedade dos Gerais', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2834, '3150505', 'Pimenta', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2835, '3150539', 'Pingo-D\'agua', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2836, '3150570', 'Pintopolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2837, '3150604', 'Piracema', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2838, '3150703', 'Pirajuba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2839, '3150802', 'Piranga', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2840, '3150901', 'Piranguçu', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2841, '3151008', 'Piranguinho', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2842, '3151107', 'Pirapetinga', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2843, '3151206', 'Pirapora', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2844, '3151305', 'Pirauba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2845, '3151404', 'Pitangui', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2846, '3151503', 'Piumhi', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2847, '3151602', 'Planura', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2848, '3151701', 'Poço Fundo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2849, '3151800', 'Poços de Caldas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2850, '3151909', 'Pocrane', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2851, '3152006', 'Pompeu', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2852, '3152105', 'Ponte Nova', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2853, '3152131', 'Ponto Chique', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2854, '3152170', 'Ponto dos Volantes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2855, '3152204', 'Porteirinha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2856, '3152303', 'Porto Firme', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2857, '3152402', 'Pote', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2858, '3152501', 'Pouso Alegre', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2859, '3152600', 'Pouso Alto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2860, '3152709', 'Prados', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2861, '3152808', 'Prata', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2862, '3152907', 'Pratapolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2863, '3153004', 'Pratinha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2864, '3153103', 'Presidente Bernardes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2865, '3153202', 'Presidente Juscelino', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2866, '3153301', 'Presidente Kubitschek', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2867, '3153400', 'Presidente Olegario', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2868, '3153509', 'Alto Jequitiba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2869, '3153608', 'Prudente de Morais', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2870, '3153707', 'Quartel Geral', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2871, '3153806', 'Queluzito', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2872, '3153905', 'Raposos', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2873, '3154002', 'Raul Soares', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2874, '3154101', 'Recreio', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2875, '3154150', 'Reduto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2876, '3154200', 'Resende Costa', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2877, '3154309', 'Resplendor', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2878, '3154408', 'Ressaquinha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2879, '3154457', 'Riachinho', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2880, '3154507', 'Riacho dos Machados', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2881, '3154606', 'Ribeirao das Neves', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2882, '3154705', 'Ribeirao Vermelho', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2883, '3154804', 'Rio Acima', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2884, '3154903', 'Rio Casca', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2885, '3155009', 'Rio Doce', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2886, '3155108', 'Rio do Prado', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2887, '3155207', 'Rio Espera', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2888, '3155306', 'Rio Manso', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2889, '3155405', 'Rio Novo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2890, '3155504', 'Rio Paranaiba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2891, '3155603', 'Rio Pardo de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2892, '3155702', 'Rio Piracicaba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2893, '3155801', 'Rio Pomba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2894, '3155900', 'Rio Preto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2895, '3156007', 'Rio Vermelho', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2896, '3156106', 'Ritapolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2897, '3156205', 'Rochedo de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2898, '3156304', 'Rodeiro', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2899, '3156403', 'Romaria', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2900, '3156452', 'Rosario da Limeira', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2901, '3156502', 'Rubelita', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2902, '3156601', 'Rubim', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2903, '3156700', 'Sabara', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2904, '3156809', 'Sabinopolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2905, '3156908', 'Sacramento', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2906, '3157005', 'Salinas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2907, '3157104', 'Salto da Divisa', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2908, '3157203', 'Santa Barbara', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2909, '3157252', 'Santa Barbara do Leste', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2910, '3157278', 'Santa Barbara do Monte Verde', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2911, '3157302', 'Santa Barbara do Tugurio', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2912, '3157336', 'Santa Cruz de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2913, '3157377', 'Santa Cruz de Salinas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2914, '3157401', 'Santa Cruz do Escalvado', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2915, '3157500', 'Santa Efigênia de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2916, '3157609', 'Santa Fe de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2917, '3157658', 'Santa Helena de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2918, '3157708', 'Santa Juliana', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2919, '3157807', 'Santa Luzia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2920, '3157906', 'Santa Margarida', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2921, '3158003', 'Santa Maria de Itabira', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2922, '3158102', 'Santa Maria do Salto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2923, '3158201', 'Santa Maria do Suaçui', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2924, '3158300', 'Santana da Vargem', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2925, '3158409', 'Santana de Cataguases', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2926, '3158508', 'Santana de Pirapama', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2927, '3158607', 'Santana do Deserto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2928, '3158706', 'Santana do Garambeu', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2929, '3158805', 'Santana do Jacare', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2930, '3158904', 'Santana do Manhuaçu', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2931, '3158953', 'Santana do Paraiso', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2932, '3159001', 'Santana do Riacho', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2933, '3159100', 'Santana dos Montes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2934, '3159209', 'Santa Rita de Caldas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2935, '3159308', 'Santa Rita de Jacutinga', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2936, '3159357', 'Santa Rita de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2937, '3159407', 'Santa Rita de Ibitipoca', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2938, '3159506', 'Santa Rita do Itueto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2939, '3159605', 'Santa Rita do Sapucai', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2940, '3159704', 'Santa Rosa da Serra', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2941, '3159803', 'Santa Vitoria', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2942, '3159902', 'Santo Antônio do Amparo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2943, '3160009', 'Santo Antônio do Aventureiro', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2944, '3160108', 'Santo Antônio do Grama', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2945, '3160207', 'Santo Antônio do Itambe', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2946, '3160306', 'Santo Antônio do Jacinto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2947, '3160405', 'Santo Antônio do Monte', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2948, '3160454', 'Santo Antônio do Retiro', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2949, '3160504', 'Santo Antônio do Rio Abaixo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2950, '3160603', 'Santo Hipolito', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2951, '3160702', 'Santos Dumont', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2952, '3160801', 'Sao Bento Abade', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2953, '3160900', 'Sao Bras do Suaçui', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2954, '3160959', 'Sao Domingos das Dores', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2955, '3161007', 'Sao Domingos do Prata', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2956, '3161056', 'Sao Felix de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2957, '3161106', 'Sao Francisco', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2958, '3161205', 'Sao Francisco de Paula', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2959, '3161304', 'Sao Francisco de Sales', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2960, '3161403', 'Sao Francisco do Gloria', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(2961, '3161502', 'Sao Geraldo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2962, '3161601', 'Sao Geraldo da Piedade', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2963, '3161650', 'Sao Geraldo do Baixio', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2964, '3161700', 'Sao Gonçalo do Abaete', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2965, '3161809', 'Sao Gonçalo do Para', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2966, '3161908', 'Sao Gonçalo do Rio Abaixo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2967, '3162005', 'Sao Gonçalo do Sapucai', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2968, '3162104', 'Sao Gotardo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2969, '3162203', 'Sao Joao Batista do Gloria', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2970, '3162252', 'Sao Joao da Lagoa', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2971, '3162302', 'Sao Joao da Mata', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2972, '3162401', 'Sao Joao da Ponte', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2973, '3162450', 'Sao Joao das Missoes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2974, '3162500', 'Sao Joao del Rei', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2975, '3162559', 'Sao Joao do Manhuaçu', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2976, '3162575', 'Sao Joao do Manteninha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2977, '3162609', 'Sao Joao do Oriente', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2978, '3162658', 'Sao Joao do Pacui', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2979, '3162708', 'Sao Joao do Paraiso', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2980, '3162807', 'Sao Joao Evangelista', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2981, '3162906', 'Sao Joao Nepomuceno', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2982, '3162922', 'Sao Joaquim de Bicas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2983, '3162948', 'Sao Jose da Barra', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2984, '3162955', 'Sao Jose da Lapa', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2985, '3163003', 'Sao Jose da Safira', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2986, '3163102', 'Sao Jose da Varginha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2987, '3163201', 'Sao Jose do Alegre', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2988, '3163300', 'Sao Jose do Divino', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2989, '3163409', 'Sao Jose do Goiabal', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2990, '3163508', 'Sao Jose do Jacuri', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2991, '3163607', 'Sao Jose do Mantimento', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2992, '3163706', 'Sao Lourenço', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2993, '3163805', 'Sao Miguel do Anta', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2994, '3163904', 'Sao Pedro da Uniao', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2995, '3164001', 'Sao Pedro dos Ferros', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2996, '3164100', 'Sao Pedro do Suaçui', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2997, '3164209', 'Sao Romao', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2998, '3164308', 'Sao Roque de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(2999, '3164407', 'Sao Sebastiao da Bela Vista', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3000, '3164431', 'Sao Sebastiao da Vargem Alegre', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3001, '3164472', 'Sao Sebastiao do Anta', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3002, '3164506', 'Sao Sebastiao do Maranhao', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3003, '3164605', 'Sao Sebastiao do Oeste', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3004, '3164704', 'Sao Sebastiao do Paraiso', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3005, '3164803', 'Sao Sebastiao do Rio Preto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3006, '3164902', 'Sao Sebastiao do Rio Verde', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3007, '3165008', 'Sao Tiago', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3008, '3165107', 'Sao Tomas de Aquino', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3009, '3165206', 'Sao Thome das Letras', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3010, '3165305', 'Sao Vicente de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3011, '3165404', 'Sapucai-Mirim', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3012, '3165503', 'Sardoa', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3013, '3165537', 'Sarzedo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3014, '3165552', 'Setubinha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3015, '3165560', 'Sem-Peixe', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3016, '3165578', 'Senador Amaral', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3017, '3165602', 'Senador Cortes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3018, '3165701', 'Senador Firmino', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3019, '3165800', 'Senador Jose Bento', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3020, '3165909', 'Senador Modestino Gonçalves', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3021, '3166006', 'Senhora de Oliveira', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3022, '3166105', 'Senhora do Porto', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3023, '3166204', 'Senhora dos Remedios', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3024, '3166303', 'Sericita', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3025, '3166402', 'Seritinga', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3026, '3166501', 'Serra Azul de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3027, '3166600', 'Serra da Saudade', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3028, '3166709', 'Serra dos Aimores', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3029, '3166808', 'Serra do Salitre', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3030, '3166907', 'Serrania', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3031, '3166956', 'Serranopolis de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3032, '3167004', 'Serranos', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3033, '3167103', 'Serro', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3034, '3167202', 'Sete Lagoas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3035, '3167301', 'Silveirânia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3036, '3167400', 'Silvianopolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3037, '3167509', 'Simao Pereira', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3038, '3167608', 'Simonesia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3039, '3167707', 'Sobralia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3040, '3167806', 'Soledade de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3041, '3167905', 'Tabuleiro', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3042, '3168002', 'Taiobeiras', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3043, '3168051', 'Taparuba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3044, '3168101', 'Tapira', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3045, '3168200', 'Tapirai', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3046, '3168309', 'Taquaraçu de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3047, '3168408', 'Tarumirim', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3048, '3168507', 'Teixeiras', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3049, '3168606', 'Teofilo Otoni', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3050, '3168705', 'Timoteo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3051, '3168804', 'Tiradentes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3052, '3168903', 'Tiros', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3053, '3169000', 'Tocantins', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3054, '3169059', 'Tocos do Moji', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3055, '3169109', 'Toledo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3056, '3169208', 'Tombos', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3057, '3169307', 'Três Coraçoes', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3058, '3169356', 'Três Marias', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3059, '3169406', 'Três Pontas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3060, '3169505', 'Tumiritinga', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3061, '3169604', 'Tupaciguara', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3062, '3169703', 'Turmalina', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3063, '3169802', 'Turvolândia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3064, '3169901', 'Uba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3065, '3170008', 'Ubai', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3066, '3170057', 'Ubaporanga', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3067, '3170107', 'Uberaba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3068, '3170206', 'Uberlândia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3069, '3170305', 'Umburatiba', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3070, '3170404', 'Unai', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3071, '3170438', 'Uniao de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3072, '3170479', 'Uruana de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3073, '3170503', 'Urucânia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3074, '3170529', 'Urucuia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3075, '3170578', 'Vargem Alegre', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3076, '3170602', 'Vargem Bonita', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3077, '3170651', 'Vargem Grande do Rio Pardo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3078, '3170701', 'Varginha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3079, '3170750', 'Varjao de Minas', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3080, '3170800', 'Varzea da Palma', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3081, '3170909', 'Varzelândia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3082, '3171006', 'Vazante', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3083, '3171030', 'Verdelândia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3084, '3171071', 'Veredinha', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3085, '3171105', 'Verissimo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3086, '3171154', 'Vermelho Novo', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3087, '3171204', 'Vespasiano', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3088, '3171303', 'Viçosa', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3089, '3171402', 'Vieiras', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3090, '3171501', 'Mathias Lobato', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3091, '3171600', 'Virgem da Lapa', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3092, '3171709', 'Virginia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3093, '3171808', 'Virginopolis', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3094, '3171907', 'Virgolândia', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3095, '3172004', 'Visconde do Rio Branco', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3096, '3172103', 'Volta Grande', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3097, '3172202', 'Wenceslau Braz', 'MG', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3098, '3200102', 'Afonso Claudio', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3099, '3200136', 'aguia Branca', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3100, '3200169', 'agua Doce do Norte', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3101, '3200201', 'Alegre', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3102, '3200300', 'Alfredo Chaves', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3103, '3200359', 'Alto Rio Novo', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3104, '3200409', 'Anchieta', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3105, '3200508', 'Apiaca', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3106, '3200607', 'Aracruz', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3107, '3200706', 'Atilio Vivacqua', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3108, '3200805', 'Baixo Guandu', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3109, '3200904', 'Barra de Sao Francisco', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3110, '3201001', 'Boa Esperança', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3111, '3201100', 'Bom Jesus do Norte', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3112, '3201159', 'Brejetuba', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3113, '3201209', 'Cachoeiro de Itapemirim', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3114, '3201308', 'Cariacica', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3115, '3201407', 'Castelo', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3116, '3201506', 'Colatina', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3117, '3201605', 'Conceiçao da Barra', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3118, '3201704', 'Conceiçao do Castelo', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3119, '3201803', 'Divino de Sao Lourenço', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3120, '3201902', 'Domingos Martins', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3121, '3202009', 'Dores do Rio Preto', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3122, '3202108', 'Ecoporanga', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3123, '3202207', 'Fundao', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3124, '3202256', 'Governador Lindenberg', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3125, '3202306', 'Guaçui', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3126, '3202405', 'Guarapari', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3127, '3202454', 'Ibatiba', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3128, '3202504', 'Ibiraçu', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3129, '3202553', 'Ibitirama', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3130, '3202603', 'Iconha', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3131, '3202652', 'Irupi', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3132, '3202702', 'Itaguaçu', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3133, '3202801', 'Itapemirim', 'ES', '2023-05-05 12:53:28', '2023-05-05 12:53:28'),
(3134, '3202900', 'Itarana', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3135, '3203007', 'Iuna', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3136, '3203056', 'Jaguare', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3137, '3203106', 'Jerônimo Monteiro', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3138, '3203130', 'Joao Neiva', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3139, '3203163', 'Laranja da Terra', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3140, '3203205', 'Linhares', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3141, '3203304', 'Mantenopolis', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3142, '3203320', 'Marataizes', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3143, '3203346', 'Marechal Floriano', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3144, '3203353', 'Marilândia', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3145, '3203403', 'Mimoso do Sul', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3146, '3203502', 'Montanha', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3147, '3203601', 'Mucurici', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3148, '3203700', 'Muniz Freire', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3149, '3203809', 'Muqui', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3150, '3203908', 'Nova Venecia', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3151, '3204005', 'Pancas', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3152, '3204054', 'Pedro Canario', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3153, '3204104', 'Pinheiros', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3154, '3204203', 'Piuma', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3155, '3204252', 'Ponto Belo', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3156, '3204302', 'Presidente Kennedy', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3157, '3204351', 'Rio Bananal', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3158, '3204401', 'Rio Novo do Sul', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3159, '3204500', 'Santa Leopoldina', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3160, '3204559', 'Santa Maria de Jetiba', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3161, '3204609', 'Santa Teresa', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3162, '3204658', 'Sao Domingos do Norte', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3163, '3204708', 'Sao Gabriel da Palha', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3164, '3204807', 'Sao Jose do Calçado', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3165, '3204906', 'Sao Mateus', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3166, '3204955', 'Sao Roque do Canaa', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3167, '3205002', 'Serra', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3168, '3205010', 'Sooretama', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3169, '3205036', 'Vargem Alta', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3170, '3205069', 'Venda Nova do Imigrante', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3171, '3205101', 'Viana', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3172, '3205150', 'Vila Pavao', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3173, '3205176', 'Vila Valerio', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3174, '3205200', 'Vila Velha', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3175, '3205309', 'Vitoria', 'ES', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3176, '3300100', 'Angra dos Reis', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3177, '3300159', 'Aperibe', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3178, '3300209', 'Araruama', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3179, '3300225', 'Areal', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3180, '3300233', 'Armaçao dos Buzios', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3181, '3300258', 'Arraial do Cabo', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3182, '3300308', 'Barra do Pirai', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3183, '3300407', 'Barra Mansa', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3184, '3300456', 'Belford Roxo', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3185, '3300506', 'Bom Jardim', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3186, '3300605', 'Bom Jesus do Itabapoana', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3187, '3300704', 'Cabo Frio', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3188, '3300803', 'Cachoeiras de Macacu', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3189, '3300902', 'Cambuci', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3190, '3300936', 'Carapebus', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3191, '3300951', 'Comendador Levy Gasparian', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3192, '3301009', 'Campos dos Goytacazes', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3193, '3301108', 'Cantagalo', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3194, '3301157', 'Cardoso Moreira', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3195, '3301207', 'Carmo', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3196, '3301306', 'Casimiro de Abreu', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3197, '3301405', 'Conceiçao de Macabu', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3198, '3301504', 'Cordeiro', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3199, '3301603', 'Duas Barras', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3200, '3301702', 'Duque de Caxias', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3201, '3301801', 'Engenheiro Paulo de Frontin', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3202, '3301850', 'Guapimirim', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3203, '3301876', 'Iguaba Grande', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3204, '3301900', 'Itaborai', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3205, '3302007', 'Itaguai', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3206, '3302056', 'Italva', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3207, '3302106', 'Itaocara', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3208, '3302205', 'Itaperuna', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3209, '3302254', 'Itatiaia', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3210, '3302270', 'Japeri', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3211, '3302304', 'Laje do Muriae', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3212, '3302403', 'Macae', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3213, '3302452', 'Macuco', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3214, '3302502', 'Mage', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3215, '3302601', 'Mangaratiba', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3216, '3302700', 'Marica', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3217, '3302809', 'Mendes', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3218, '3302858', 'Mesquita', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3219, '3302908', 'Miguel Pereira', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3220, '3303005', 'Miracema', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3221, '3303104', 'Natividade', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3222, '3303203', 'Nilopolis', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3223, '3303302', 'Niteroi', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3224, '3303401', 'Nova Friburgo', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3225, '3303500', 'Nova Iguaçu', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3226, '3303609', 'Paracambi', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3227, '3303708', 'Paraiba do Sul', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3228, '3303807', 'Paraty', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3229, '3303856', 'Paty do Alferes', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3230, '3303906', 'Petropolis', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3231, '3303955', 'Pinheiral', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3232, '3304003', 'Pirai', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3233, '3304102', 'Porciuncula', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3234, '3304110', 'Porto Real', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3235, '3304128', 'Quatis', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3236, '3304144', 'Queimados', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3237, '3304151', 'Quissama', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3238, '3304201', 'Resende', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3239, '3304300', 'Rio Bonito', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3240, '3304409', 'Rio Claro', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3241, '3304508', 'Rio das Flores', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3242, '3304524', 'Rio das Ostras', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3243, '3304557', 'Rio de Janeiro', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3244, '3304607', 'Santa Maria Madalena', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3245, '3304706', 'Santo Antônio de Padua', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3246, '3304755', 'Sao Francisco de Itabapoana', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3247, '3304805', 'Sao Fidelis', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3248, '3304904', 'Sao Gonçalo', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3249, '3305000', 'Sao Joao da Barra', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3250, '3305109', 'Sao Joao de Meriti', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3251, '3305133', 'Sao Jose de Uba', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3252, '3305158', 'Sao Jose do Vale do Rio Preto', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3253, '3305208', 'Sao Pedro da Aldeia', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3254, '3305307', 'Sao Sebastiao do Alto', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3255, '3305406', 'Sapucaia', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3256, '3305505', 'Saquarema', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3257, '3305554', 'Seropedica', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3258, '3305604', 'Silva Jardim', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3259, '3305703', 'Sumidouro', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3260, '3305752', 'Tangua', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3261, '3305802', 'Teresopolis', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3262, '3305901', 'Trajano de Moraes', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3263, '3306008', 'Três Rios', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3264, '3306107', 'Valença', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3265, '3306156', 'Varre-Sai', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3266, '3306206', 'Vassouras', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3267, '3306305', 'Volta Redonda', 'RJ', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3268, '3500105', 'Adamantina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3269, '3500204', 'Adolfo', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3270, '3500303', 'Aguai', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3271, '3500402', 'aguas da Prata', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3272, '3500501', 'aguas de Lindoia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3273, '3500550', 'aguas de Santa Barbara', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3274, '3500600', 'aguas de Sao Pedro', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3275, '3500709', 'Agudos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3276, '3500758', 'Alambari', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3277, '3500808', 'Alfredo Marcondes', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3278, '3500907', 'Altair', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3279, '3501004', 'Altinopolis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3280, '3501103', 'Alto Alegre', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3281, '3501152', 'Aluminio', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3282, '3501202', 'alvares Florence', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3283, '3501301', 'alvares Machado', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3284, '3501400', 'alvaro de Carvalho', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3285, '3501509', 'Alvinlândia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3286, '3501608', 'Americana', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3287, '3501707', 'Americo Brasiliense', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3288, '3501806', 'Americo de Campos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3289, '3501905', 'Amparo', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3290, '3502002', 'Analândia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3291, '3502101', 'Andradina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3292, '3502200', 'Angatuba', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3293, '3502309', 'Anhembi', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3294, '3502408', 'Anhumas', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3295, '3502507', 'Aparecida', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3296, '3502606', 'Aparecida D\'Oeste', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3297, '3502705', 'Apiai', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3298, '3502754', 'Araçariguama', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3299, '3502804', 'Araçatuba', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3300, '3502903', 'Araçoiaba da Serra', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3301, '3503000', 'Aramina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3302, '3503109', 'Arandu', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3303, '3503158', 'Arapei', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3304, '3503208', 'Araraquara', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3305, '3503307', 'Araras', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3306, '3503356', 'Arco-iris', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3307, '3503406', 'Arealva', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3308, '3503505', 'Areias', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3309, '3503604', 'Areiopolis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3310, '3503703', 'Ariranha', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3311, '3503802', 'Artur Nogueira', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3312, '3503901', 'Aruja', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3313, '3503950', 'Aspasia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3314, '3504008', 'Assis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3315, '3504107', 'Atibaia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3316, '3504206', 'Auriflama', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3317, '3504305', 'Avai', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3318, '3504404', 'Avanhandava', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3319, '3504503', 'Avare', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3320, '3504602', 'Bady Bassitt', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3321, '3504701', 'Balbinos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3322, '3504800', 'Balsamo', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3323, '3504909', 'Bananal', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3324, '3505005', 'Barao de Antonina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3325, '3505104', 'Barbosa', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3326, '3505203', 'Bariri', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3327, '3505302', 'Barra Bonita', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3328, '3505351', 'Barra do Chapeu', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3329, '3505401', 'Barra do Turvo', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3330, '3505500', 'Barretos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3331, '3505609', 'Barrinha', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3332, '3505708', 'Barueri', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3333, '3505807', 'Bastos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3334, '3505906', 'Batatais', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3335, '3506003', 'Bauru', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3336, '3506102', 'Bebedouro', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3337, '3506201', 'Bento de Abreu', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3338, '3506300', 'Bernardino de Campos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3339, '3506359', 'Bertioga', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3340, '3506409', 'Bilac', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3341, '3506508', 'Birigui', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3342, '3506607', 'Biritiba-Mirim', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3343, '3506706', 'Boa Esperança do Sul', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3344, '3506805', 'Bocaina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3345, '3506904', 'Bofete', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3346, '3507001', 'Boituva', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3347, '3507100', 'Bom Jesus dos Perdoes', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3348, '3507159', 'Bom Sucesso de Itarare', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3349, '3507209', 'Bora', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3350, '3507308', 'Boraceia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3351, '3507407', 'Borborema', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3352, '3507456', 'Borebi', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3353, '3507506', 'Botucatu', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3354, '3507605', 'Bragança Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3355, '3507704', 'Brauna', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3356, '3507753', 'Brejo Alegre', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3357, '3507803', 'Brodowski', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3358, '3507902', 'Brotas', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3359, '3508009', 'Buri', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3360, '3508108', 'Buritama', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3361, '3508207', 'Buritizal', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3362, '3508306', 'Cabralia Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3363, '3508405', 'Cabreuva', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3364, '3508504', 'Caçapava', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3365, '3508603', 'Cachoeira Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3366, '3508702', 'Caconde', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3367, '3508801', 'Cafelândia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3368, '3508900', 'Caiabu', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3369, '3509007', 'Caieiras', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3370, '3509106', 'Caiua', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3371, '3509205', 'Cajamar', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3372, '3509254', 'Cajati', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3373, '3509304', 'Cajobi', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3374, '3509403', 'Cajuru', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3375, '3509452', 'Campina do Monte Alegre', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3376, '3509502', 'Campinas', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3377, '3509601', 'Campo Limpo Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3378, '3509700', 'Campos do Jordao', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3379, '3509809', 'Campos Novos Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3380, '3509908', 'Cananeia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3381, '3509957', 'Canas', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3382, '3510005', 'Cândido Mota', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3383, '3510104', 'Cândido Rodrigues', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3384, '3510153', 'Canitar', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3385, '3510203', 'Capao Bonito', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3386, '3510302', 'Capela do Alto', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3387, '3510401', 'Capivari', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3388, '3510500', 'Caraguatatuba', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3389, '3510609', 'Carapicuiba', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3390, '3510708', 'Cardoso', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3391, '3510807', 'Casa Branca', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3392, '3510906', 'Cassia dos Coqueiros', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3393, '3511003', 'Castilho', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3394, '3511102', 'Catanduva', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3395, '3511201', 'Catigua', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3396, '3511300', 'Cedral', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3397, '3511409', 'Cerqueira Cesar', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3398, '3511508', 'Cerquilho', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3399, '3511607', 'Cesario Lange', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3400, '3511706', 'Charqueada', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3401, '3511904', 'Clementina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3402, '3512001', 'Colina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3403, '3512100', 'Colômbia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3404, '3512209', 'Conchal', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3405, '3512308', 'Conchas', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3406, '3512407', 'Cordeiropolis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3407, '3512506', 'Coroados', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3408, '3512605', 'Coronel Macedo', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3409, '3512704', 'Corumbatai', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3410, '3512803', 'Cosmopolis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3411, '3512902', 'Cosmorama', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3412, '3513009', 'Cotia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3413, '3513108', 'Cravinhos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3414, '3513207', 'Cristais Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3415, '3513306', 'Cruzalia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3416, '3513405', 'Cruzeiro', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3417, '3513504', 'Cubatao', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3418, '3513603', 'Cunha', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3419, '3513702', 'Descalvado', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3420, '3513801', 'Diadema', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3421, '3513850', 'Dirce Reis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3422, '3513900', 'Divinolândia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3423, '3514007', 'Dobrada', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3424, '3514106', 'Dois Corregos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3425, '3514205', 'Dolcinopolis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3426, '3514304', 'Dourado', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3427, '3514403', 'Dracena', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3428, '3514502', 'Duartina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3429, '3514601', 'Dumont', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3430, '3514700', 'Echapora', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3431, '3514809', 'Eldorado', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3432, '3514908', 'Elias Fausto', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3433, '3514924', 'Elisiario', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3434, '3514957', 'Embauba', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3435, '3515004', 'Embu das Artes', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3436, '3515103', 'Embu-Guaçu', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3437, '3515129', 'Emilianopolis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3438, '3515152', 'Engenheiro Coelho', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3439, '3515186', 'Espirito Santo do Pinhal', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3440, '3515194', 'Espirito Santo do Turvo', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3441, '3515202', 'Estrela D\'Oeste', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3442, '3515301', 'Estrela do Norte', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3443, '3515350', 'Euclides da Cunha Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3444, '3515400', 'Fartura', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3445, '3515509', 'Fernandopolis', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3446, '3515608', 'Fernando Prestes', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3447, '3515657', 'Fernao', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3448, '3515707', 'Ferraz de Vasconcelos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3449, '3515806', 'Flora Rica', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3450, '3515905', 'Floreal', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3451, '3516002', 'Florida Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3452, '3516101', 'Florinia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3453, '3516200', 'Franca', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3454, '3516309', 'Francisco Morato', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3455, '3516408', 'Franco da Rocha', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3456, '3516507', 'Gabriel Monteiro', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3457, '3516606', 'Galia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3458, '3516705', 'Garça', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3459, '3516804', 'Gastao Vidigal', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3460, '3516853', 'Gaviao Peixoto', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3461, '3516903', 'General Salgado', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3462, '3517000', 'Getulina', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3463, '3517109', 'Glicerio', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3464, '3517208', 'Guaiçara', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3465, '3517307', 'Guaimbê', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3466, '3517406', 'Guaira', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3467, '3517505', 'Guapiaçu', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3468, '3517604', 'Guapiara', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3469, '3517703', 'Guara', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3470, '3517802', 'Guaraçai', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3471, '3517901', 'Guaraci', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3472, '3518008', 'Guarani D\'Oeste', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3473, '3518107', 'Guaranta', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3474, '3518206', 'Guararapes', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3475, '3518305', 'Guararema', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3476, '3518404', 'Guaratingueta', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3477, '3518503', 'Guarei', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3478, '3518602', 'Guariba', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3479, '3518701', 'Guaruja', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3480, '3518800', 'Guarulhos', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3481, '3518859', 'Guatapara', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3482, '3518909', 'Guzolândia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3483, '3519006', 'Herculândia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3484, '3519055', 'Holambra', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3485, '3519071', 'Hortolândia', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3486, '3519105', 'Iacanga', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3487, '3519204', 'Iacri', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3488, '3519253', 'Iaras', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3489, '3519303', 'Ibate', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3490, '3519402', 'Ibira', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3491, '3519501', 'Ibirarema', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3492, '3519600', 'Ibitinga', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3493, '3519709', 'Ibiuna', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3494, '3519808', 'Icem', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3495, '3519907', 'Iepê', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3496, '3520004', 'Igaraçu do Tietê', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3497, '3520103', 'Igarapava', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3498, '3520202', 'Igarata', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3499, '3520301', 'Iguape', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3500, '3520400', 'Ilhabela', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3501, '3520426', 'Ilha Comprida', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3502, '3520442', 'Ilha Solteira', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3503, '3520509', 'Indaiatuba', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3504, '3520608', 'Indiana', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3505, '3520707', 'Indiapora', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3506, '3520806', 'Inubia Paulista', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3507, '3520905', 'Ipaussu', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3508, '3521002', 'Ipero', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3509, '3521101', 'Ipeuna', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3510, '3521150', 'Ipigua', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3511, '3521200', 'Iporanga', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3512, '3521309', 'Ipua', 'SP', '2023-05-05 12:53:29', '2023-05-05 12:53:29'),
(3513, '3521408', 'Iracemapolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3514, '3521507', 'Irapua', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3515, '3521606', 'Irapuru', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3516, '3521705', 'Itabera', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3517, '3521804', 'Itai', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3518, '3521903', 'Itajobi', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3519, '3522000', 'Itaju', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3520, '3522109', 'Itanhaem', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3521, '3522158', 'Itaoca', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3522, '3522208', 'Itapecerica da Serra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3523, '3522307', 'Itapetininga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3524, '3522406', 'Itapeva', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3525, '3522505', 'Itapevi', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3526, '3522604', 'Itapira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3527, '3522653', 'Itapirapua Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3528, '3522703', 'Itapolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3529, '3522802', 'Itaporanga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3530, '3522901', 'Itapui', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3531, '3523008', 'Itapura', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3532, '3523107', 'Itaquaquecetuba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3533, '3523206', 'Itarare', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3534, '3523305', 'Itariri', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3535, '3523404', 'Itatiba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3536, '3523503', 'Itatinga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3537, '3523602', 'Itirapina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3538, '3523701', 'Itirapua', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3539, '3523800', 'Itobi', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3540, '3523909', 'Itu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3541, '3524006', 'Itupeva', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3542, '3524105', 'Ituverava', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3543, '3524204', 'Jaborandi', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3544, '3524303', 'Jaboticabal', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3545, '3524402', 'Jacarei', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3546, '3524501', 'Jaci', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3547, '3524600', 'Jacupiranga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3548, '3524709', 'Jaguariuna', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3549, '3524808', 'Jales', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3550, '3524907', 'Jambeiro', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3551, '3525003', 'Jandira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(3552, '3525102', 'Jardinopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3553, '3525201', 'Jarinu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3554, '3525300', 'Jau', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3555, '3525409', 'Jeriquara', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3556, '3525508', 'Joanopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3557, '3525607', 'Joao Ramalho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3558, '3525706', 'Jose Bonifacio', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3559, '3525805', 'Julio Mesquita', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3560, '3525854', 'Jumirim', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3561, '3525904', 'Jundiai', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3562, '3526001', 'Junqueiropolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3563, '3526100', 'Juquia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3564, '3526209', 'Juquitiba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3565, '3526308', 'Lagoinha', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3566, '3526407', 'Laranjal Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3567, '3526506', 'Lavinia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3568, '3526605', 'Lavrinhas', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3569, '3526704', 'Leme', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3570, '3526803', 'Lençois Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3571, '3526902', 'Limeira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3572, '3527009', 'Lindoia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3573, '3527108', 'Lins', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3574, '3527207', 'Lorena', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3575, '3527256', 'Lourdes', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3576, '3527306', 'Louveira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3577, '3527405', 'Lucelia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3578, '3527504', 'Lucianopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3579, '3527603', 'Luis Antônio', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3580, '3527702', 'Luiziânia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3581, '3527801', 'Lupercio', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3582, '3527900', 'Lutecia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3583, '3528007', 'Macatuba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3584, '3528106', 'Macaubal', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3585, '3528205', 'Macedônia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3586, '3528304', 'Magda', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3587, '3528403', 'Mairinque', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3588, '3528502', 'Mairipora', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3589, '3528601', 'Manduri', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3590, '3528700', 'Maraba Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3591, '3528809', 'Maracai', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3592, '3528858', 'Marapoama', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3593, '3528908', 'Mariapolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3594, '3529005', 'Marilia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3595, '3529104', 'Marinopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3596, '3529203', 'Martinopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3597, '3529302', 'Matao', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3598, '3529401', 'Maua', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3599, '3529500', 'Mendonça', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3600, '3529609', 'Meridiano', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3601, '3529658', 'Mesopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3602, '3529708', 'Miguelopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3603, '3529807', 'Mineiros do Tietê', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3604, '3529906', 'Miracatu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3605, '3530003', 'Mira Estrela', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3606, '3530102', 'Mirandopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3607, '3530201', 'Mirante do Paranapanema', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3608, '3530300', 'Mirassol', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3609, '3530409', 'Mirassolândia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3610, '3530508', 'Mococa', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3611, '3530607', 'Mogi das Cruzes', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3612, '3530706', 'Mogi Guaçu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3613, '3530805', 'Moji Mirim', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3614, '3530904', 'Mombuca', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3615, '3531001', 'Monçoes', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3616, '3531100', 'Mongagua', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3617, '3531209', 'Monte Alegre do Sul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3618, '3531308', 'Monte Alto', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3619, '3531407', 'Monte Aprazivel', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3620, '3531506', 'Monte Azul Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3621, '3531605', 'Monte Castelo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3622, '3531704', 'Monteiro Lobato', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3623, '3531803', 'Monte Mor', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3624, '3531902', 'Morro Agudo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3625, '3532009', 'Morungaba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3626, '3532058', 'Motuca', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3627, '3532108', 'Murutinga do Sul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3628, '3532157', 'Nantes', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3629, '3532207', 'Narandiba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3630, '3532306', 'Natividade da Serra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3631, '3532405', 'Nazare Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3632, '3532504', 'Neves Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3633, '3532603', 'Nhandeara', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3634, '3532702', 'Nipoa', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3635, '3532801', 'Nova Aliança', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3636, '3532827', 'Nova Campina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3637, '3532843', 'Nova Canaa Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3638, '3532868', 'Nova Castilho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3639, '3532900', 'Nova Europa', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3640, '3533007', 'Nova Granada', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3641, '3533106', 'Nova Guataporanga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3642, '3533205', 'Nova Independência', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3643, '3533254', 'Novais', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3644, '3533304', 'Nova Luzitânia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3645, '3533403', 'Nova Odessa', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3646, '3533502', 'Novo Horizonte', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3647, '3533601', 'Nuporanga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3648, '3533700', 'Ocauçu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3649, '3533809', 'oleo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3650, '3533908', 'Olimpia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3651, '3534005', 'Onda Verde', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3652, '3534104', 'Oriente', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3653, '3534203', 'Orindiuva', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3654, '3534302', 'Orlândia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3655, '3534401', 'Osasco', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3656, '3534500', 'Oscar Bressane', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3657, '3534609', 'Osvaldo Cruz', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3658, '3534708', 'Ourinhos', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3659, '3534757', 'Ouroeste', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3660, '3534807', 'Ouro Verde', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3661, '3534906', 'Pacaembu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3662, '3535002', 'Palestina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3663, '3535101', 'Palmares Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3664, '3535200', 'Palmeira D\'Oeste', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3665, '3535309', 'Palmital', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3666, '3535408', 'Panorama', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3667, '3535507', 'Paraguaçu Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3668, '3535606', 'Paraibuna', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3669, '3535705', 'Paraiso', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3670, '3535804', 'Paranapanema', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3671, '3535903', 'Paranapua', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3672, '3536000', 'Parapua', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3673, '3536109', 'Pardinho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3674, '3536208', 'Pariquera-Açu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3675, '3536257', 'Parisi', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3676, '3536307', 'Patrocinio Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3677, '3536406', 'Pauliceia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3678, '3536505', 'Paulinia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3679, '3536570', 'Paulistânia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3680, '3536604', 'Paulo de Faria', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3681, '3536703', 'Pederneiras', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3682, '3536802', 'Pedra Bela', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3683, '3536901', 'Pedranopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3684, '3537008', 'Pedregulho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3685, '3537107', 'Pedreira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3686, '3537156', 'Pedrinhas Paulista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3687, '3537206', 'Pedro de Toledo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3688, '3537305', 'Penapolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3689, '3537404', 'Pereira Barreto', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3690, '3537503', 'Pereiras', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3691, '3537602', 'Peruibe', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3692, '3537701', 'Piacatu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3693, '3537800', 'Piedade', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3694, '3537909', 'Pilar do Sul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3695, '3538006', 'Pindamonhangaba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3696, '3538105', 'Pindorama', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3697, '3538204', 'Pinhalzinho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3698, '3538303', 'Piquerobi', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3699, '3538501', 'Piquete', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3700, '3538600', 'Piracaia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3701, '3538709', 'Piracicaba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3702, '3538808', 'Piraju', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3703, '3538907', 'Pirajui', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3704, '3539004', 'Pirangi', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3705, '3539103', 'Pirapora do Bom Jesus', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3706, '3539202', 'Pirapozinho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3707, '3539301', 'Pirassununga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3708, '3539400', 'Piratininga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3709, '3539509', 'Pitangueiras', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3710, '3539608', 'Planalto', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3711, '3539707', 'Platina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3712, '3539806', 'Poa', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3713, '3539905', 'Poloni', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3714, '3540002', 'Pompeia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3715, '3540101', 'Pongai', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3716, '3540200', 'Pontal', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3717, '3540259', 'Pontalinda', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3718, '3540309', 'Pontes Gestal', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3719, '3540408', 'Populina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3720, '3540507', 'Porangaba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3721, '3540606', 'Porto Feliz', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3722, '3540705', 'Porto Ferreira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3723, '3540754', 'Potim', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3724, '3540804', 'Potirendaba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3725, '3540853', 'Pracinha', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3726, '3540903', 'Pradopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3727, '3541000', 'Praia Grande', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3728, '3541059', 'Pratânia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3729, '3541109', 'Presidente Alves', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3730, '3541208', 'Presidente Bernardes', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3731, '3541307', 'Presidente Epitacio', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3732, '3541406', 'Presidente Prudente', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3733, '3541505', 'Presidente Venceslau', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3734, '3541604', 'Promissao', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3735, '3541653', 'Quadra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3736, '3541703', 'Quata', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3737, '3541802', 'Queiroz', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3738, '3541901', 'Queluz', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3739, '3542008', 'Quintana', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3740, '3542107', 'Rafard', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3741, '3542206', 'Rancharia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3742, '3542305', 'Redençao da Serra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3743, '3542404', 'Regente Feijo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3744, '3542503', 'Reginopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3745, '3542602', 'Registro', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3746, '3542701', 'Restinga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3747, '3542800', 'Ribeira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3748, '3542909', 'Ribeirao Bonito', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3749, '3543006', 'Ribeirao Branco', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3750, '3543105', 'Ribeirao Corrente', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3751, '3543204', 'Ribeirao do Sul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3752, '3543238', 'Ribeirao dos indios', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3753, '3543253', 'Ribeirao Grande', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3754, '3543303', 'Ribeirao Pires', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3755, '3543402', 'Ribeirao Preto', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3756, '3543501', 'Riversul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3757, '3543600', 'Rifaina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3758, '3543709', 'Rincao', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3759, '3543808', 'Rinopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3760, '3543907', 'Rio Claro', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3761, '3544004', 'Rio das Pedras', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3762, '3544103', 'Rio Grande da Serra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3763, '3544202', 'Riolândia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3764, '3544251', 'Rosana', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3765, '3544301', 'Roseira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3766, '3544400', 'Rubiacea', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3767, '3544509', 'Rubineia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3768, '3544608', 'Sabino', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3769, '3544707', 'Sagres', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3770, '3544806', 'Sales', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3771, '3544905', 'Sales Oliveira', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3772, '3545001', 'Salesopolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3773, '3545100', 'Salmourao', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3774, '3545159', 'Saltinho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3775, '3545209', 'Salto', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3776, '3545308', 'Salto de Pirapora', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3777, '3545407', 'Salto Grande', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3778, '3545506', 'Sandovalina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3779, '3545605', 'Santa Adelia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3780, '3545704', 'Santa Albertina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3781, '3545803', 'Santa Barbara D\'Oeste', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3782, '3546009', 'Santa Branca', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3783, '3546108', 'Santa Clara D\'Oeste', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3784, '3546207', 'Santa Cruz da Conceiçao', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3785, '3546256', 'Santa Cruz da Esperança', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3786, '3546306', 'Santa Cruz das Palmeiras', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3787, '3546405', 'Santa Cruz do Rio Pardo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3788, '3546504', 'Santa Ernestina', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3789, '3546603', 'Santa Fe do Sul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3790, '3546702', 'Santa Gertrudes', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3791, '3546801', 'Santa Isabel', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3792, '3546900', 'Santa Lucia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3793, '3547007', 'Santa Maria da Serra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3794, '3547106', 'Santa Mercedes', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3795, '3547205', 'Santana da Ponte Pensa', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3796, '3547304', 'Santana de Parnaiba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3797, '3547403', 'Santa Rita D\'Oeste', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3798, '3547502', 'Santa Rita do Passa Quatro', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3799, '3547601', 'Santa Rosa de Viterbo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3800, '3547650', 'Santa Salete', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3801, '3547700', 'Santo Anastacio', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3802, '3547809', 'Santo Andre', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3803, '3547908', 'Santo Antônio da Alegria', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3804, '3548005', 'Santo Antônio de Posse', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3805, '3548054', 'Santo Antônio do Aracangua', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3806, '3548104', 'Santo Antônio do Jardim', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3807, '3548203', 'Santo Antônio do Pinhal', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3808, '3548302', 'Santo Expedito', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3809, '3548401', 'Santopolis do Aguapei', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3810, '3548500', 'Santos', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3811, '3548609', 'Sao Bento do Sapucai', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3812, '3548708', 'Sao Bernardo do Campo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3813, '3548807', 'Sao Caetano do Sul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3814, '3548906', 'Sao Carlos', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3815, '3549003', 'Sao Francisco', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3816, '3549102', 'Sao Joao da Boa Vista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3817, '3549201', 'Sao Joao das Duas Pontes', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3818, '3549250', 'Sao Joao de Iracema', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3819, '3549300', 'Sao Joao do Pau D\'Alho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3820, '3549409', 'Sao Joaquim da Barra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3821, '3549508', 'Sao Jose da Bela Vista', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3822, '3549607', 'Sao Jose do Barreiro', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3823, '3549706', 'Sao Jose do Rio Pardo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3824, '3549805', 'Sao Jose do Rio Preto', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3825, '3549904', 'Sao Jose dos Campos', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3826, '3549953', 'Sao Lourenço da Serra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3827, '3550001', 'Sao Luis do Paraitinga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3828, '3550100', 'Sao Manuel', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3829, '3550209', 'Sao Miguel Arcanjo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3830, '3550308', 'Sao Paulo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3831, '3550407', 'Sao Pedro', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3832, '3550506', 'Sao Pedro do Turvo', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3833, '3550605', 'Sao Roque', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3834, '3550704', 'Sao Sebastiao', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3835, '3550803', 'Sao Sebastiao da Grama', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3836, '3550902', 'Sao Simao', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3837, '3551009', 'Sao Vicente', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3838, '3551108', 'Sarapui', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3839, '3551207', 'Sarutaia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3840, '3551306', 'Sebastianopolis do Sul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3841, '3551405', 'Serra Azul', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3842, '3551504', 'Serrana', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3843, '3551603', 'Serra Negra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3844, '3551702', 'Sertaozinho', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3845, '3551801', 'Sete Barras', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3846, '3551900', 'Severinia', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3847, '3552007', 'Silveiras', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3848, '3552106', 'Socorro', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3849, '3552205', 'Sorocaba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3850, '3552304', 'Sud Mennucci', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3851, '3552403', 'Sumare', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3852, '3552502', 'Suzano', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3853, '3552551', 'Suzanapolis', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3854, '3552601', 'Tabapua', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3855, '3552700', 'Tabatinga', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3856, '3552809', 'Taboao da Serra', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3857, '3552908', 'Taciba', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3858, '3553005', 'Taguai', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3859, '3553104', 'Taiaçu', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3860, '3553203', 'Taiuva', 'SP', '2023-05-05 12:53:30', '2023-05-05 12:53:30'),
(3861, '3553302', 'Tambau', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3862, '3553401', 'Tanabi', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3863, '3553500', 'Tapirai', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3864, '3553609', 'Tapiratiba', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3865, '3553658', 'Taquaral', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3866, '3553708', 'Taquaritinga', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3867, '3553807', 'Taquarituba', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3868, '3553856', 'Taquarivai', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3869, '3553906', 'Tarabai', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3870, '3553955', 'Taruma', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3871, '3554003', 'Tatui', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3872, '3554102', 'Taubate', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3873, '3554201', 'Tejupa', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3874, '3554300', 'Teodoro Sampaio', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3875, '3554409', 'Terra Roxa', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3876, '3554508', 'Tietê', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3877, '3554607', 'Timburi', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3878, '3554656', 'Torre de Pedra', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3879, '3554706', 'Torrinha', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3880, '3554755', 'Trabiju', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3881, '3554805', 'Tremembe', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3882, '3554904', 'Três Fronteiras', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3883, '3554953', 'Tuiuti', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3884, '3555000', 'Tupa', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3885, '3555109', 'Tupi Paulista', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3886, '3555208', 'Turiuba', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3887, '3555307', 'Turmalina', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3888, '3555356', 'Ubarana', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3889, '3555406', 'Ubatuba', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3890, '3555505', 'Ubirajara', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3891, '3555604', 'Uchoa', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3892, '3555703', 'Uniao Paulista', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3893, '3555802', 'Urânia', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3894, '3555901', 'Uru', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3895, '3556008', 'Urupês', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3896, '3556107', 'Valentim Gentil', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3897, '3556206', 'Valinhos', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3898, '3556305', 'Valparaiso', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3899, '3556354', 'Vargem', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3900, '3556404', 'Vargem Grande do Sul', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3901, '3556453', 'Vargem Grande Paulista', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3902, '3556503', 'Varzea Paulista', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3903, '3556602', 'Vera Cruz', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3904, '3556701', 'Vinhedo', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3905, '3556800', 'Viradouro', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3906, '3556909', 'Vista Alegre do Alto', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3907, '3556958', 'Vitoria Brasil', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3908, '3557006', 'Votorantim', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3909, '3557105', 'Votuporanga', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3910, '3557154', 'Zacarias', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3911, '3557204', 'Chavantes', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3912, '3557303', 'Estiva Gerbi', 'SP', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3913, '4100103', 'Abatia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3914, '4100202', 'Adrianopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3915, '4100301', 'Agudos do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3916, '4100400', 'Almirante Tamandare', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3917, '4100459', 'Altamira do Parana', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3918, '4100509', 'Altônia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3919, '4100608', 'Alto Parana', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3920, '4100707', 'Alto Piquiri', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3921, '4100806', 'Alvorada do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3922, '4100905', 'Amapora', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3923, '4101002', 'Ampere', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3924, '4101051', 'Anahy', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3925, '4101101', 'Andira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3926, '4101150', 'Ângulo', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3927, '4101200', 'Antonina', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3928, '4101309', 'Antônio Olinto', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3929, '4101408', 'Apucarana', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3930, '4101507', 'Arapongas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3931, '4101606', 'Arapoti', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3932, '4101655', 'Arapua', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3933, '4101705', 'Araruna', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3934, '4101804', 'Araucaria', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3935, '4101853', 'Ariranha do Ivai', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3936, '4101903', 'Assai', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3937, '4102000', 'Assis Chateaubriand', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3938, '4102109', 'Astorga', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3939, '4102208', 'Atalaia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3940, '4102307', 'Balsa Nova', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3941, '4102406', 'Bandeirantes', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3942, '4102505', 'Barbosa Ferraz', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3943, '4102604', 'Barracao', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3944, '4102703', 'Barra do Jacare', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3945, '4102752', 'Bela Vista da Caroba', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3946, '4102802', 'Bela Vista do Paraiso', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3947, '4102901', 'Bituruna', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3948, '4103008', 'Boa Esperança', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3949, '4103024', 'Boa Esperança do Iguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3950, '4103040', 'Boa Ventura de Sao Roque', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3951, '4103057', 'Boa Vista da Aparecida', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3952, '4103107', 'Bocaiuva do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3953, '4103156', 'Bom Jesus do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3954, '4103206', 'Bom Sucesso', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3955, '4103222', 'Bom Sucesso do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3956, '4103305', 'Borrazopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3957, '4103354', 'Braganey', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3958, '4103370', 'Brasilândia do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3959, '4103404', 'Cafeara', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3960, '4103453', 'Cafelândia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3961, '4103479', 'Cafezal do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3962, '4103503', 'California', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3963, '4103602', 'Cambara', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3964, '4103701', 'Cambe', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3965, '4103800', 'Cambira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3966, '4103909', 'Campina da Lagoa', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3967, '4103958', 'Campina do Simao', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3968, '4104006', 'Campina Grande do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3969, '4104055', 'Campo Bonito', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3970, '4104105', 'Campo do Tenente', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3971, '4104204', 'Campo Largo', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3972, '4104253', 'Campo Magro', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3973, '4104303', 'Campo Mourao', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3974, '4104402', 'Cândido de Abreu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3975, '4104428', 'Candoi', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3976, '4104451', 'Cantagalo', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3977, '4104501', 'Capanema', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3978, '4104600', 'Capitao Leônidas Marques', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3979, '4104659', 'Carambei', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3980, '4104709', 'Carlopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3981, '4104808', 'Cascavel', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3982, '4104907', 'Castro', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3983, '4105003', 'Catanduvas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3984, '4105102', 'Centenario do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3985, '4105201', 'Cerro Azul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3986, '4105300', 'Ceu Azul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3987, '4105409', 'Chopinzinho', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3988, '4105508', 'Cianorte', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3989, '4105607', 'cidades Gaucha', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3990, '4105706', 'Clevelândia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3991, '4105805', 'Colombo', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3992, '4105904', 'Colorado', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3993, '4106001', 'Congonhinhas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3994, '4106100', 'Conselheiro Mairinck', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3995, '4106209', 'Contenda', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3996, '4106308', 'Corbelia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3997, '4106407', 'Cornelio Procopio', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3998, '4106456', 'Coronel Domingos Soares', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(3999, '4106506', 'Coronel Vivida', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4000, '4106555', 'Corumbatai do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4001, '4106571', 'Cruzeiro do Iguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4002, '4106605', 'Cruzeiro do Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4003, '4106704', 'Cruzeiro do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4004, '4106803', 'Cruz Machado', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4005, '4106852', 'Cruzmaltina', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4006, '4106902', 'Curitiba', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4007, '4107009', 'Curiuva', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4008, '4107108', 'Diamante do Norte', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4009, '4107124', 'Diamante do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4010, '4107157', 'Diamante D\'Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4011, '4107207', 'Dois Vizinhos', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4012, '4107256', 'Douradina', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4013, '4107306', 'Doutor Camargo', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4014, '4107405', 'Eneas Marques', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4015, '4107504', 'Engenheiro Beltrao', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4016, '4107520', 'Esperança Nova', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4017, '4107538', 'Entre Rios do Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4018, '4107546', 'Espigao Alto do Iguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4019, '4107553', 'Farol', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4020, '4107603', 'Faxinal', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4021, '4107652', 'Fazenda Rio Grande', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4022, '4107702', 'Fênix', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4023, '4107736', 'Fernandes Pinheiro', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4024, '4107751', 'Figueira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4025, '4107801', 'Florai', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4026, '4107850', 'Flor da Serra do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4027, '4107900', 'Floresta', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4028, '4108007', 'Florestopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4029, '4108106', 'Florida', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4030, '4108205', 'Formosa do Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4031, '4108304', 'Foz do Iguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4032, '4108320', 'Francisco Alves', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4033, '4108403', 'Francisco Beltrao', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4034, '4108452', 'Foz do Jordao', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4035, '4108502', 'General Carneiro', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4036, '4108551', 'Godoy Moreira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4037, '4108601', 'Goioerê', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4038, '4108650', 'Goioxim', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4039, '4108700', 'Grandes Rios', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4040, '4108809', 'Guaira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4041, '4108908', 'Guairaça', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4042, '4108957', 'Guamiranga', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4043, '4109005', 'Guapirama', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4044, '4109104', 'Guaporema', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4045, '4109203', 'Guaraci', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4046, '4109302', 'Guaraniaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4047, '4109401', 'Guarapuava', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4048, '4109500', 'Guaraqueçaba', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4049, '4109609', 'Guaratuba', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4050, '4109658', 'Honorio Serpa', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4051, '4109708', 'Ibaiti', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4052, '4109757', 'Ibema', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4053, '4109807', 'Ibipora', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4054, '4109906', 'Icaraima', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4055, '4110003', 'Iguaraçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4056, '4110052', 'Iguatu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4057, '4110078', 'Imbau', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4058, '4110102', 'Imbituva', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4059, '4110201', 'Inacio Martins', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4060, '4110300', 'Inaja', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4061, '4110409', 'Indianopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4062, '4110508', 'Ipiranga', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4063, '4110607', 'Ipora', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4064, '4110656', 'Iracema do Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4065, '4110706', 'Irati', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4066, '4110805', 'Iretama', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4067, '4110904', 'Itaguaje', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4068, '4110953', 'Itaipulândia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4069, '4111001', 'Itambaraca', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4070, '4111100', 'Itambe', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4071, '4111209', 'Itapejara D\'Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4072, '4111258', 'Itaperuçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4073, '4111308', 'Itauna do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4074, '4111407', 'Ivai', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4075, '4111506', 'Ivaipora', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4076, '4111555', 'Ivate', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4077, '4111605', 'Ivatuba', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4078, '4111704', 'Jaboti', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4079, '4111803', 'Jacarezinho', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4080, '4111902', 'Jaguapita', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4081, '4112009', 'Jaguariaiva', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4082, '4112108', 'Jandaia do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4083, '4112207', 'Janiopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4084, '4112306', 'Japira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4085, '4112405', 'Japura', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4086, '4112504', 'Jardim Alegre', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4087, '4112603', 'Jardim Olinda', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4088, '4112702', 'Jataizinho', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4089, '4112751', 'Jesuitas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4090, '4112801', 'Joaquim Tavora', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4091, '4112900', 'Jundiai do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4092, '4112959', 'Juranda', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4093, '4113007', 'Jussara', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4094, '4113106', 'Kalore', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4095, '4113205', 'Lapa', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4096, '4113254', 'Laranjal', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4097, '4113304', 'Laranjeiras do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4098, '4113403', 'Leopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4099, '4113429', 'Lidianopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4100, '4113452', 'Lindoeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4101, '4113502', 'Loanda', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4102, '4113601', 'Lobato', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4103, '4113700', 'Londrina', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4104, '4113734', 'Luiziana', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4105, '4113759', 'Lunardelli', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4106, '4113809', 'Lupionopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4107, '4113908', 'Mallet', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4108, '4114005', 'Mamborê', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4109, '4114104', 'Mandaguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4110, '4114203', 'Mandaguari', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4111, '4114302', 'Mandirituba', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4112, '4114351', 'Manfrinopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4113, '4114401', 'Mangueirinha', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4114, '4114500', 'Manoel Ribas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4115, '4114609', 'Marechal Cândido Rondon', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4116, '4114708', 'Maria Helena', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4117, '4114807', 'Marialva', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4118, '4114906', 'Marilândia do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4119, '4115002', 'Marilena', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4120, '4115101', 'Mariluz', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4121, '4115200', 'Maringa', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4122, '4115309', 'Mariopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4123, '4115358', 'Maripa', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4124, '4115408', 'Marmeleiro', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4125, '4115457', 'Marquinho', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4126, '4115507', 'Marumbi', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4127, '4115606', 'Matelândia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4128, '4115705', 'Matinhos', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4129, '4115739', 'Mato Rico', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4130, '4115754', 'Maua da Serra', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4131, '4115804', 'Medianeira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4132, '4115853', 'Mercedes', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4133, '4115903', 'Mirador', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4134, '4116000', 'Miraselva', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4135, '4116059', 'Missal', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4136, '4116109', 'Moreira Sales', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4137, '4116208', 'Morretes', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4138, '4116307', 'Munhoz de Melo', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4139, '4116406', 'Nossa Senhora das Graças', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4140, '4116505', 'Nova Aliança do Ivai', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4141, '4116604', 'Nova America da Colina', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4142, '4116703', 'Nova Aurora', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4143, '4116802', 'Nova Cantu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(4144, '4116901', 'Nova Esperança', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4145, '4116950', 'Nova Esperança do Sudoeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4146, '4117008', 'Nova Fatima', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4147, '4117057', 'Nova Laranjeiras', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4148, '4117107', 'Nova Londrina', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4149, '4117206', 'Nova Olimpia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4150, '4117214', 'Nova Santa Barbara', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4151, '4117222', 'Nova Santa Rosa', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4152, '4117255', 'Nova Prata do Iguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4153, '4117271', 'Nova Tebas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4154, '4117297', 'Novo Itacolomi', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4155, '4117305', 'Ortigueira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4156, '4117404', 'Ourizona', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4157, '4117453', 'Ouro Verde do Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4158, '4117503', 'Paiçandu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4159, '4117602', 'Palmas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4160, '4117701', 'Palmeira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4161, '4117800', 'Palmital', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4162, '4117909', 'Palotina', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4163, '4118006', 'Paraiso do Norte', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4164, '4118105', 'Paranacity', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4165, '4118204', 'Paranagua', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4166, '4118303', 'Paranapoema', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4167, '4118402', 'Paranavai', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4168, '4118451', 'Pato Bragado', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4169, '4118501', 'Pato Branco', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4170, '4118600', 'Paula Freitas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4171, '4118709', 'Paulo Frontin', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4172, '4118808', 'Peabiru', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4173, '4118857', 'Perobal', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4174, '4118907', 'Perola', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4175, '4119004', 'Perola D\'Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4176, '4119103', 'Piên', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4177, '4119152', 'Pinhais', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4178, '4119202', 'Pinhalao', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4179, '4119251', 'Pinhal de Sao Bento', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4180, '4119301', 'Pinhao', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4181, '4119400', 'Pirai do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4182, '4119509', 'Piraquara', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4183, '4119608', 'Pitanga', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4184, '4119657', 'Pitangueiras', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4185, '4119707', 'Planaltina do Parana', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4186, '4119806', 'Planalto', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4187, '4119905', 'Ponta Grossa', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4188, '4119954', 'Pontal do Parana', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4189, '4120002', 'Porecatu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4190, '4120101', 'Porto Amazonas', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4191, '4120150', 'Porto Barreiro', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4192, '4120200', 'Porto Rico', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4193, '4120309', 'Porto Vitoria', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4194, '4120333', 'Prado Ferreira', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4195, '4120358', 'Pranchita', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4196, '4120408', 'Presidente Castelo Branco', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4197, '4120507', 'Primeiro de Maio', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4198, '4120606', 'Prudentopolis', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4199, '4120655', 'Quarto Centenario', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4200, '4120705', 'Quatigua', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4201, '4120804', 'Quatro Barras', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4202, '4120853', 'Quatro Pontes', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4203, '4120903', 'Quedas do Iguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4204, '4121000', 'Querência do Norte', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4205, '4121109', 'Quinta do Sol', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4206, '4121208', 'Quitandinha', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4207, '4121257', 'Ramilândia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4208, '4121307', 'Rancho Alegre', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4209, '4121356', 'Rancho Alegre D\'Oeste', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4210, '4121406', 'Realeza', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4211, '4121505', 'Rebouças', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4212, '4121604', 'Renascença', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4213, '4121703', 'Reserva', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4214, '4121752', 'Reserva do Iguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4215, '4121802', 'Ribeirao Claro', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4216, '4121901', 'Ribeirao do Pinhal', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4217, '4122008', 'Rio Azul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4218, '4122107', 'Rio Bom', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4219, '4122156', 'Rio Bonito do Iguaçu', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4220, '4122172', 'Rio Branco do Ivai', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4221, '4122206', 'Rio Branco do Sul', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4222, '4122305', 'Rio Negro', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4223, '4122404', 'Rolândia', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4224, '4122503', 'Roncador', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4225, '4122602', 'Rondon', 'PR', '2023-05-05 12:53:31', '2023-05-05 12:53:31'),
(4226, '4122651', 'Rosario do Ivai', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4227, '4122701', 'Sabaudia', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4228, '4122800', 'Salgado Filho', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4229, '4122909', 'Salto do Itarare', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4230, '4123006', 'Salto do Lontra', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4231, '4123105', 'Santa Amelia', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4232, '4123204', 'Santa Cecilia do Pavao', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4233, '4123303', 'Santa Cruz de Monte Castelo', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4234, '4123402', 'Santa Fe', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4235, '4123501', 'Santa Helena', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4236, '4123600', 'Santa Inês', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4237, '4123709', 'Santa Isabel do Ivai', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4238, '4123808', 'Santa Izabel do Oeste', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4239, '4123824', 'Santa Lucia', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4240, '4123857', 'Santa Maria do Oeste', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4241, '4123907', 'Santa Mariana', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4242, '4123956', 'Santa Mônica', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4243, '4124004', 'Santana do Itarare', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4244, '4124020', 'Santa Tereza do Oeste', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4245, '4124053', 'Santa Terezinha de Itaipu', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4246, '4124103', 'Santo Antônio da Platina', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4247, '4124202', 'Santo Antônio do Caiua', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4248, '4124301', 'Santo Antônio do Paraiso', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4249, '4124400', 'Santo Antônio do Sudoeste', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4250, '4124509', 'Santo Inacio', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4251, '4124608', 'Sao Carlos do Ivai', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4252, '4124707', 'Sao Jerônimo da Serra', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4253, '4124806', 'Sao Joao', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4254, '4124905', 'Sao Joao do Caiua', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4255, '4125001', 'Sao Joao do Ivai', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4256, '4125100', 'Sao Joao do Triunfo', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4257, '4125209', 'Sao Jorge D\'Oeste', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4258, '4125308', 'Sao Jorge do Ivai', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4259, '4125357', 'Sao Jorge do Patrocinio', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4260, '4125407', 'Sao Jose da Boa Vista', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4261, '4125456', 'Sao Jose das Palmeiras', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4262, '4125506', 'Sao Jose dos Pinhais', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4263, '4125555', 'Sao Manoel do Parana', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4264, '4125605', 'Sao Mateus do Sul', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4265, '4125704', 'Sao Miguel do Iguaçu', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4266, '4125753', 'Sao Pedro do Iguaçu', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4267, '4125803', 'Sao Pedro do Ivai', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4268, '4125902', 'Sao Pedro do Parana', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4269, '4126009', 'Sao Sebastiao da Amoreira', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4270, '4126108', 'Sao Tome', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4271, '4126207', 'Sapopema', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4272, '4126256', 'Sarandi', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4273, '4126272', 'Saudade do Iguaçu', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4274, '4126306', 'Senges', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4275, '4126355', 'Serranopolis do Iguaçu', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4276, '4126405', 'Sertaneja', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4277, '4126504', 'Sertanopolis', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4278, '4126603', 'Siqueira Campos', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4279, '4126652', 'Sulina', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4280, '4126678', 'Tamarana', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4281, '4126702', 'Tamboara', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4282, '4126801', 'Tapejara', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4283, '4126900', 'Tapira', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4284, '4127007', 'Teixeira Soares', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4285, '4127106', 'Telêmaco Borba', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4286, '4127205', 'Terra Boa', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4287, '4127304', 'Terra Rica', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4288, '4127403', 'Terra Roxa', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4289, '4127502', 'Tibagi', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4290, '4127601', 'Tijucas do Sul', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4291, '4127700', 'Toledo', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4292, '4127809', 'Tomazina', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4293, '4127858', 'Três Barras do Parana', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4294, '4127882', 'Tunas do Parana', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4295, '4127908', 'Tuneiras do Oeste', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4296, '4127957', 'Tupassi', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4297, '4127965', 'Turvo', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4298, '4128005', 'Ubirata', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4299, '4128104', 'Umuarama', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4300, '4128203', 'Uniao da Vitoria', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4301, '4128302', 'Uniflor', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4302, '4128401', 'Urai', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4303, '4128500', 'Wenceslau Braz', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4304, '4128534', 'Ventania', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4305, '4128559', 'Vera Cruz do Oeste', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4306, '4128609', 'Verê', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4307, '4128625', 'Alto Paraiso', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4308, '4128633', 'Doutor Ulysses', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4309, '4128658', 'Virmond', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4310, '4128708', 'Vitorino', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4311, '4128807', 'Xambrê', 'PR', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4312, '4200051', 'Abdon Batista', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4313, '4200101', 'Abelardo Luz', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4314, '4200200', 'Agrolândia', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4315, '4200309', 'Agronômica', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4316, '4200408', 'agua Doce', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4317, '4200507', 'aguas de Chapeco', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4318, '4200556', 'aguas Frias', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4319, '4200606', 'aguas Mornas', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4320, '4200705', 'Alfredo Wagner', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4321, '4200754', 'Alto Bela Vista', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4322, '4200804', 'Anchieta', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4323, '4200903', 'Angelina', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4324, '4201000', 'Anita Garibaldi', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4325, '4201109', 'Anitapolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4326, '4201208', 'Antônio Carlos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4327, '4201257', 'Apiuna', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4328, '4201273', 'Arabuta', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4329, '4201307', 'Araquari', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4330, '4201406', 'Ararangua', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4331, '4201505', 'Armazem', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4332, '4201604', 'Arroio Trinta', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4333, '4201653', 'Arvoredo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4334, '4201703', 'Ascurra', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4335, '4201802', 'Atalanta', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4336, '4201901', 'Aurora', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4337, '4201950', 'Balneario Arroio do Silva', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4338, '4202008', 'Balneario Camboriu', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4339, '4202057', 'Balneario Barra do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4340, '4202073', 'Balneario Gaivota', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4341, '4202081', 'Bandeirante', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4342, '4202099', 'Barra Bonita', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4343, '4202107', 'Barra Velha', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4344, '4202131', 'Bela Vista do Toldo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4345, '4202156', 'Belmonte', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4346, '4202206', 'Benedito Novo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4347, '4202305', 'Biguaçu', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4348, '4202404', 'Blumenau', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4349, '4202438', 'Bocaina do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4350, '4202453', 'Bombinhas', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4351, '4202503', 'Bom Jardim da Serra', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4352, '4202537', 'Bom Jesus', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4353, '4202578', 'Bom Jesus do Oeste', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4354, '4202602', 'Bom Retiro', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4355, '4202701', 'Botuvera', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4356, '4202800', 'Braço do Norte', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4357, '4202859', 'Braço do Trombudo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4358, '4202875', 'Brunopolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4359, '4202909', 'Brusque', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4360, '4203006', 'Caçador', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4361, '4203105', 'Caibi', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4362, '4203154', 'Calmon', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4363, '4203204', 'Camboriu', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4364, '4203253', 'Capao Alto', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4365, '4203303', 'Campo Alegre', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4366, '4203402', 'Campo Belo do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4367, '4203501', 'Campo Erê', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4368, '4203600', 'Campos Novos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4369, '4203709', 'Canelinha', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4370, '4203808', 'Canoinhas', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4371, '4203907', 'Capinzal', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4372, '4203956', 'Capivari de Baixo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4373, '4204004', 'Catanduvas', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4374, '4204103', 'Caxambu do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4375, '4204152', 'Celso Ramos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4376, '4204178', 'Cerro Negro', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4377, '4204194', 'Chapadao do Lageado', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4378, '4204202', 'Chapeco', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4379, '4204251', 'Cocal do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4380, '4204301', 'Concordia', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4381, '4204350', 'Cordilheira Alta', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4382, '4204400', 'Coronel Freitas', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4383, '4204459', 'Coronel Martins', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4384, '4204509', 'Corupa', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4385, '4204558', 'Correia Pinto', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4386, '4204608', 'Criciuma', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4387, '4204707', 'Cunha Pora', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4388, '4204756', 'Cunhatai', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4389, '4204806', 'Curitibanos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4390, '4204905', 'Descanso', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4391, '4205001', 'Dionisio Cerqueira', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4392, '4205100', 'Dona Emma', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4393, '4205159', 'Doutor Pedrinho', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4394, '4205175', 'Entre Rios', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4395, '4205191', 'Ermo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4396, '4205209', 'Erval Velho', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4397, '4205308', 'Faxinal dos Guedes', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4398, '4205357', 'Flor do Sertao', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4399, '4205407', 'Florianopolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4400, '4205431', 'Formosa do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4401, '4205456', 'Forquilhinha', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4402, '4205506', 'Fraiburgo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4403, '4205555', 'Frei Rogerio', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4404, '4205605', 'Galvao', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4405, '4205704', 'Garopaba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4406, '4205803', 'Garuva', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4407, '4205902', 'Gaspar', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4408, '4206009', 'Governador Celso Ramos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4409, '4206108', 'Grao Para', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4410, '4206207', 'Gravatal', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4411, '4206306', 'Guabiruba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4412, '4206405', 'Guaraciaba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4413, '4206504', 'Guaramirim', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4414, '4206603', 'Guaruja do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4415, '4206652', 'Guatambu', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4416, '4206702', 'Herval D\'Oeste', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4417, '4206751', 'Ibiam', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4418, '4206801', 'Ibicare', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4419, '4206900', 'Ibirama', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4420, '4207007', 'Içara', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4421, '4207106', 'Ilhota', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4422, '4207205', 'Imarui', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4423, '4207304', 'Imbituba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4424, '4207403', 'Imbuia', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4425, '4207502', 'Indaial', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4426, '4207577', 'Iomerê', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4427, '4207601', 'Ipira', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4428, '4207650', 'Ipora do Oeste', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4429, '4207684', 'Ipuaçu', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4430, '4207700', 'Ipumirim', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4431, '4207759', 'Iraceminha', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4432, '4207809', 'Irani', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4433, '4207858', 'Irati', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4434, '4207908', 'Irineopolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4435, '4208005', 'Ita', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4436, '4208104', 'Itaiopolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4437, '4208203', 'Itajai', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4438, '4208302', 'Itapema', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4439, '4208401', 'Itapiranga', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4440, '4208450', 'Itapoa', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4441, '4208500', 'Ituporanga', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4442, '4208609', 'Jabora', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4443, '4208708', 'Jacinto Machado', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4444, '4208807', 'Jaguaruna', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4445, '4208906', 'Jaragua do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4446, '4208955', 'Jardinopolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4447, '4209003', 'Joaçaba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4448, '4209102', 'Joinville', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4449, '4209151', 'Jose Boiteux', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4450, '4209177', 'Jupia', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4451, '4209201', 'Lacerdopolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4452, '4209300', 'Lages', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4453, '4209409', 'Laguna', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4454, '4209458', 'Lajeado Grande', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4455, '4209508', 'Laurentino', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4456, '4209607', 'Lauro Muller', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4457, '4209706', 'Lebon Regis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4458, '4209805', 'Leoberto Leal', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4459, '4209854', 'Lindoia do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4460, '4209904', 'Lontras', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4461, '4210001', 'Luiz Alves', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4462, '4210035', 'Luzerna', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4463, '4210050', 'Macieira', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4464, '4210100', 'Mafra', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4465, '4210209', 'Major Gercino', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4466, '4210308', 'Major Vieira', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4467, '4210407', 'Maracaja', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4468, '4210506', 'Maravilha', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4469, '4210555', 'Marema', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4470, '4210605', 'Massaranduba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4471, '4210704', 'Matos Costa', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4472, '4210803', 'Meleiro', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4473, '4210852', 'Mirim Doce', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4474, '4210902', 'Modelo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4475, '4211009', 'Mondai', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4476, '4211058', 'Monte Carlo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4477, '4211108', 'Monte Castelo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4478, '4211207', 'Morro da Fumaça', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4479, '4211256', 'Morro Grande', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4480, '4211306', 'Navegantes', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4481, '4211405', 'Nova Erechim', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4482, '4211454', 'Nova Itaberaba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4483, '4211504', 'Nova Trento', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4484, '4211603', 'Nova Veneza', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4485, '4211652', 'Novo Horizonte', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4486, '4211702', 'Orleans', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4487, '4211751', 'Otacilio Costa', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4488, '4211801', 'Ouro', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4489, '4211850', 'Ouro Verde', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4490, '4211876', 'Paial', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4491, '4211892', 'Painel', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4492, '4211900', 'Palhoça', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4493, '4212007', 'Palma Sola', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4494, '4212056', 'Palmeira', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4495, '4212106', 'Palmitos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4496, '4212205', 'Papanduva', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4497, '4212239', 'Paraiso', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4498, '4212254', 'Passo de Torres', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4499, '4212270', 'Passos Maia', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4500, '4212304', 'Paulo Lopes', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4501, '4212403', 'Pedras Grandes', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4502, '4212502', 'Penha', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4503, '4212601', 'Peritiba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4504, '4212650', 'Pescaria Brava', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4505, '4212700', 'Petrolândia', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4506, '4212809', 'Balneario Piçarras', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4507, '4212908', 'Pinhalzinho', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4508, '4213005', 'Pinheiro Preto', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4509, '4213104', 'Piratuba', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4510, '4213153', 'Planalto Alegre', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4511, '4213203', 'Pomerode', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4512, '4213302', 'Ponte Alta', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4513, '4213351', 'Ponte Alta do Norte', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4514, '4213401', 'Ponte Serrada', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4515, '4213500', 'Porto Belo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4516, '4213609', 'Porto Uniao', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4517, '4213708', 'Pouso Redondo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4518, '4213807', 'Praia Grande', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4519, '4213906', 'Presidente Castello Branco', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4520, '4214003', 'Presidente Getulio', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4521, '4214102', 'Presidente Nereu', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4522, '4214151', 'Princesa', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4523, '4214201', 'Quilombo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4524, '4214300', 'Rancho Queimado', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4525, '4214409', 'Rio das Antas', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4526, '4214508', 'Rio do Campo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4527, '4214607', 'Rio do Oeste', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4528, '4214706', 'Rio dos Cedros', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4529, '4214805', 'Rio do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4530, '4214904', 'Rio Fortuna', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4531, '4215000', 'Rio Negrinho', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4532, '4215059', 'Rio Rufino', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4533, '4215075', 'Riqueza', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4534, '4215109', 'Rodeio', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4535, '4215208', 'Romelândia', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4536, '4215307', 'Salete', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4537, '4215356', 'Saltinho', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4538, '4215406', 'Salto Veloso', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4539, '4215455', 'Sangao', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4540, '4215505', 'Santa Cecilia', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4541, '4215554', 'Santa Helena', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4542, '4215604', 'Santa Rosa de Lima', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4543, '4215653', 'Santa Rosa do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4544, '4215679', 'Santa Terezinha', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4545, '4215687', 'Santa Terezinha do Progresso', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4546, '4215695', 'Santiago do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4547, '4215703', 'Santo Amaro da Imperatriz', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4548, '4215752', 'Sao Bernardino', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4549, '4215802', 'Sao Bento do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4550, '4215901', 'Sao Bonifacio', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4551, '4216008', 'Sao Carlos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4552, '4216057', 'Sao Cristovao do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4553, '4216107', 'Sao Domingos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4554, '4216206', 'Sao Francisco do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4555, '4216255', 'Sao Joao do Oeste', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4556, '4216305', 'Sao Joao Batista', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4557, '4216354', 'Sao Joao do Itaperiu', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4558, '4216404', 'Sao Joao do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4559, '4216503', 'Sao Joaquim', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4560, '4216602', 'Sao Jose', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4561, '4216701', 'Sao Jose do Cedro', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4562, '4216800', 'Sao Jose do Cerrito', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4563, '4216909', 'Sao Lourenço do Oeste', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4564, '4217006', 'Sao Ludgero', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4565, '4217105', 'Sao Martinho', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4566, '4217154', 'Sao Miguel da Boa Vista', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4567, '4217204', 'Sao Miguel do Oeste', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4568, '4217253', 'Sao Pedro de Alcântara', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4569, '4217303', 'Saudades', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4570, '4217402', 'Schroeder', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4571, '4217501', 'Seara', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4572, '4217550', 'Serra Alta', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4573, '4217600', 'Sideropolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4574, '4217709', 'Sombrio', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4575, '4217758', 'Sul Brasil', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4576, '4217808', 'Taio', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4577, '4217907', 'Tangara', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4578, '4217956', 'Tigrinhos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4579, '4218004', 'Tijucas', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4580, '4218103', 'Timbe do Sul', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4581, '4218202', 'Timbo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4582, '4218251', 'Timbo Grande', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4583, '4218301', 'Três Barras', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4584, '4218350', 'Treviso', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4585, '4218400', 'Treze de Maio', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4586, '4218509', 'Treze Tilias', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4587, '4218608', 'Trombudo Central', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4588, '4218707', 'Tubarao', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4589, '4218756', 'Tunapolis', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4590, '4218806', 'Turvo', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4591, '4218855', 'Uniao do Oeste', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4592, '4218905', 'Urubici', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4593, '4218954', 'Urupema', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4594, '4219002', 'Urussanga', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4595, '4219101', 'Vargeao', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4596, '4219150', 'Vargem', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4597, '4219176', 'Vargem Bonita', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4598, '4219200', 'Vidal Ramos', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4599, '4219309', 'Videira', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4600, '4219358', 'Vitor Meireles', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4601, '4219408', 'Witmarsum', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4602, '4219507', 'Xanxerê', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4603, '4219606', 'Xavantina', 'SC', '2023-05-05 12:53:32', '2023-05-05 12:53:32'),
(4604, '4219705', 'Xaxim', 'SC', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4605, '4219853', 'Zortea', 'SC', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4606, '4220000', 'Balneario Rincao', 'SC', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4607, '4300034', 'Acegua', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4608, '4300059', 'agua Santa', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4609, '4300109', 'Agudo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4610, '4300208', 'Ajuricaba', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4611, '4300307', 'Alecrim', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4612, '4300406', 'Alegrete', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4613, '4300455', 'Alegria', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4614, '4300471', 'Almirante Tamandare do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4615, '4300505', 'Alpestre', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4616, '4300554', 'Alto Alegre', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4617, '4300570', 'Alto Feliz', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4618, '4300604', 'Alvorada', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4619, '4300638', 'Amaral Ferrador', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4620, '4300646', 'Ametista do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4621, '4300661', 'Andre da Rocha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4622, '4300703', 'Anta Gorda', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4623, '4300802', 'Antônio Prado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4624, '4300851', 'Arambare', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4625, '4300877', 'Ararica', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4626, '4300901', 'Aratiba', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4627, '4301008', 'Arroio do Meio', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4628, '4301057', 'Arroio do Sal', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4629, '4301073', 'Arroio do Padre', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4630, '4301107', 'Arroio dos Ratos', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4631, '4301206', 'Arroio do Tigre', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4632, '4301305', 'Arroio Grande', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4633, '4301404', 'Arvorezinha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4634, '4301503', 'Augusto Pestana', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4635, '4301552', 'aurea', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4636, '4301602', 'Bage', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4637, '4301636', 'Balneario Pinhal', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4638, '4301651', 'Barao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4639, '4301701', 'Barao de Cotegipe', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4640, '4301750', 'Barao do Triunfo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4641, '4301800', 'Barracao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4642, '4301859', 'Barra do Guarita', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4643, '4301875', 'Barra do Quarai', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4644, '4301909', 'Barra do Ribeiro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4645, '4301925', 'Barra do Rio Azul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4646, '4301958', 'Barra Funda', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4647, '4302006', 'Barros Cassal', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4648, '4302055', 'Benjamin Constant do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4649, '4302105', 'Bento Gonçalves', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4650, '4302154', 'Boa Vista das Missoes', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4651, '4302204', 'Boa Vista do Burica', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4652, '4302220', 'Boa Vista do Cadeado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4653, '4302238', 'Boa Vista do Incra', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4654, '4302253', 'Boa Vista do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4655, '4302303', 'Bom Jesus', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4656, '4302352', 'Bom Principio', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4657, '4302378', 'Bom Progresso', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4658, '4302402', 'Bom Retiro do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4659, '4302451', 'Boqueirao do Leao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4660, '4302501', 'Bossoroca', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4661, '4302584', 'Bozano', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4662, '4302600', 'Braga', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4663, '4302659', 'Brochier', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4664, '4302709', 'Butia', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4665, '4302808', 'Caçapava do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4666, '4302907', 'Cacequi', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4667, '4303004', 'Cachoeira do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4668, '4303103', 'Cachoeirinha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4669, '4303202', 'Cacique Doble', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4670, '4303301', 'Caibate', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4671, '4303400', 'Caiçara', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4672, '4303509', 'Camaqua', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4673, '4303558', 'Camargo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4674, '4303608', 'Cambara do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4675, '4303673', 'Campestre da Serra', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4676, '4303707', 'Campina das Missoes', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4677, '4303806', 'Campinas do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4678, '4303905', 'Campo Bom', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4679, '4304002', 'Campo Novo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4680, '4304101', 'Campos Borges', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4681, '4304200', 'Candelaria', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4682, '4304309', 'Cândido Godoi', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4683, '4304358', 'Candiota', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4684, '4304408', 'Canela', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4685, '4304507', 'Canguçu', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4686, '4304606', 'Canoas', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4687, '4304614', 'Canudos do Vale', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4688, '4304622', 'Capao Bonito do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4689, '4304630', 'Capao da Canoa', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4690, '4304655', 'Capao do Cipo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4691, '4304663', 'Capao do Leao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4692, '4304671', 'Capivari do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4693, '4304689', 'Capela de Santana', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4694, '4304697', 'Capitao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4695, '4304705', 'Carazinho', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4696, '4304713', 'Caraa', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4697, '4304804', 'Carlos Barbosa', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4698, '4304853', 'Carlos Gomes', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4699, '4304903', 'Casca', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4700, '4304952', 'Caseiros', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4701, '4305009', 'Catuipe', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4702, '4305108', 'Caxias do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4703, '4305116', 'Centenario', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4704, '4305124', 'Cerrito', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4705, '4305132', 'Cerro Branco', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4706, '4305157', 'Cerro Grande', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4707, '4305173', 'Cerro Grande do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4708, '4305207', 'Cerro Largo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4709, '4305306', 'Chapada', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4710, '4305355', 'Charqueadas', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4711, '4305371', 'Charrua', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4712, '4305405', 'Chiapetta', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4713, '4305439', 'Chui', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4714, '4305447', 'Chuvisca', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4715, '4305454', 'Cidreira', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4716, '4305504', 'Ciriaco', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4717, '4305587', 'Colinas', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4718, '4305603', 'Colorado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4719, '4305702', 'Condor', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4720, '4305801', 'Constantina', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4721, '4305835', 'Coqueiro Baixo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4722, '4305850', 'Coqueiros do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4723, '4305871', 'Coronel Barros', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4724, '4305900', 'Coronel Bicaco', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4725, '4305934', 'Coronel Pilar', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4726, '4305959', 'Cotipora', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4727, '4305975', 'Coxilha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4728, '4306007', 'Crissiumal', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4729, '4306056', 'Cristal', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4730, '4306072', 'Cristal do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4731, '4306106', 'Cruz Alta', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4732, '4306130', 'Cruzaltense', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(4733, '4306205', 'Cruzeiro do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4734, '4306304', 'David Canabarro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4735, '4306320', 'Derrubadas', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4736, '4306353', 'Dezesseis de Novembro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4737, '4306379', 'Dilermando de Aguiar', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4738, '4306403', 'Dois Irmaos', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4739, '4306429', 'Dois Irmaos das Missoes', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4740, '4306452', 'Dois Lajeados', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4741, '4306502', 'Dom Feliciano', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4742, '4306551', 'Dom Pedro de Alcântara', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4743, '4306601', 'Dom Pedrito', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4744, '4306700', 'Dona Francisca', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4745, '4306734', 'Doutor Mauricio Cardoso', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4746, '4306759', 'Doutor Ricardo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4747, '4306767', 'Eldorado do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4748, '4306809', 'Encantado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4749, '4306908', 'Encruzilhada do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4750, '4306924', 'Engenho Velho', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4751, '4306932', 'Entre-Ijuis', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4752, '4306957', 'Entre Rios do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4753, '4306973', 'Erebango', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4754, '4307005', 'Erechim', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4755, '4307054', 'Ernestina', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4756, '4307104', 'Herval', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4757, '4307203', 'Erval Grande', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4758, '4307302', 'Erval Seco', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4759, '4307401', 'Esmeralda', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4760, '4307450', 'Esperança do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4761, '4307500', 'Espumoso', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4762, '4307559', 'Estaçao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4763, '4307609', 'Estância Velha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4764, '4307708', 'Esteio', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4765, '4307807', 'Estrela', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4766, '4307815', 'Estrela Velha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4767, '4307831', 'Eugênio de Castro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4768, '4307864', 'Fagundes Varela', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4769, '4307906', 'Farroupilha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4770, '4308003', 'Faxinal do Soturno', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4771, '4308052', 'Faxinalzinho', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4772, '4308078', 'Fazenda Vilanova', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4773, '4308102', 'Feliz', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4774, '4308201', 'Flores da Cunha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4775, '4308250', 'Floriano Peixoto', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4776, '4308300', 'Fontoura Xavier', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4777, '4308409', 'Formigueiro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4778, '4308433', 'Forquetinha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4779, '4308458', 'Fortaleza dos Valos', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4780, '4308508', 'Frederico Westphalen', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4781, '4308607', 'Garibaldi', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4782, '4308656', 'Garruchos', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4783, '4308706', 'Gaurama', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4784, '4308805', 'General Câmara', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4785, '4308854', 'Gentil', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4786, '4308904', 'Getulio Vargas', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4787, '4309001', 'Girua', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4788, '4309050', 'Glorinha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4789, '4309100', 'Gramado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4790, '4309126', 'Gramado dos Loureiros', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4791, '4309159', 'Gramado Xavier', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4792, '4309209', 'Gravatai', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4793, '4309258', 'Guabiju', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4794, '4309308', 'Guaiba', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4795, '4309407', 'Guapore', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4796, '4309506', 'Guarani das Missoes', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4797, '4309555', 'Harmonia', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4798, '4309571', 'Herveiras', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4799, '4309605', 'Horizontina', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4800, '4309654', 'Hulha Negra', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4801, '4309704', 'Humaita', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4802, '4309753', 'Ibarama', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4803, '4309803', 'Ibiaça', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4804, '4309902', 'Ibiraiaras', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4805, '4309951', 'Ibirapuita', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4806, '4310009', 'Ibiruba', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4807, '4310108', 'Igrejinha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4808, '4310207', 'Ijui', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4809, '4310306', 'Ilopolis', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4810, '4310330', 'Imbe', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4811, '4310363', 'Imigrante', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4812, '4310405', 'Independência', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4813, '4310413', 'Inhacora', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4814, '4310439', 'Ipê', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4815, '4310462', 'Ipiranga do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4816, '4310504', 'Irai', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4817, '4310538', 'Itaara', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4818, '4310553', 'Itacurubi', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4819, '4310579', 'Itapuca', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4820, '4310603', 'Itaqui', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4821, '4310652', 'Itati', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4822, '4310702', 'Itatiba do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4823, '4310751', 'Ivora', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4824, '4310801', 'Ivoti', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4825, '4310850', 'Jaboticaba', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4826, '4310876', 'Jacuizinho', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4827, '4310900', 'Jacutinga', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4828, '4311007', 'Jaguarao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4829, '4311106', 'Jaguari', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4830, '4311122', 'Jaquirana', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4831, '4311130', 'Jari', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4832, '4311155', 'Joia', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4833, '4311205', 'Julio de Castilhos', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4834, '4311239', 'Lagoa Bonita do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4835, '4311254', 'Lagoao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4836, '4311270', 'Lagoa dos Três Cantos', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4837, '4311304', 'Lagoa Vermelha', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4838, '4311403', 'Lajeado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4839, '4311429', 'Lajeado do Bugre', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4840, '4311502', 'Lavras do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4841, '4311601', 'Liberato Salzano', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4842, '4311627', 'Lindolfo Collor', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4843, '4311643', 'Linha Nova', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4844, '4311700', 'Machadinho', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4845, '4311718', 'Maçambara', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4846, '4311734', 'Mampituba', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4847, '4311759', 'Manoel Viana', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4848, '4311775', 'Maquine', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4849, '4311791', 'Marata', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4850, '4311809', 'Marau', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4851, '4311908', 'Marcelino Ramos', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4852, '4311981', 'Mariana Pimentel', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4853, '4312005', 'Mariano Moro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4854, '4312054', 'Marques de Souza', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4855, '4312104', 'Mata', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4856, '4312138', 'Mato Castelhano', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4857, '4312153', 'Mato Leitao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4858, '4312179', 'Mato Queimado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4859, '4312203', 'Maximiliano de Almeida', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4860, '4312252', 'Minas do Leao', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4861, '4312302', 'Miraguai', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4862, '4312351', 'Montauri', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4863, '4312377', 'Monte Alegre dos Campos', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4864, '4312385', 'Monte Belo do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4865, '4312401', 'Montenegro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4866, '4312427', 'Mormaço', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4867, '4312443', 'Morrinhos do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4868, '4312450', 'Morro Redondo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4869, '4312476', 'Morro Reuter', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4870, '4312500', 'Mostardas', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4871, '4312609', 'Muçum', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4872, '4312617', 'Muitos Capoes', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4873, '4312625', 'Muliterno', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4874, '4312658', 'Nao-Me-Toque', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4875, '4312674', 'Nicolau Vergueiro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4876, '4312708', 'Nonoai', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4877, '4312757', 'Nova Alvorada', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4878, '4312807', 'Nova Araça', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4879, '4312906', 'Nova Bassano', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4880, '4312955', 'Nova Boa Vista', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4881, '4313003', 'Nova Brescia', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4882, '4313011', 'Nova Candelaria', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4883, '4313037', 'Nova Esperança do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4884, '4313060', 'Nova Hartz', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4885, '4313086', 'Nova Padua', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4886, '4313102', 'Nova Palma', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4887, '4313201', 'Nova Petropolis', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4888, '4313300', 'Nova Prata', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4889, '4313334', 'Nova Ramada', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4890, '4313359', 'Nova Roma do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4891, '4313375', 'Nova Santa Rita', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4892, '4313391', 'Novo Cabrais', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4893, '4313409', 'Novo Hamburgo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4894, '4313425', 'Novo Machado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4895, '4313441', 'Novo Tiradentes', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4896, '4313466', 'Novo Xingu', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4897, '4313490', 'Novo Barreiro', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4898, '4313508', 'Osorio', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4899, '4313607', 'Paim Filho', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4900, '4313656', 'Palmares do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4901, '4313706', 'Palmeira das Missoes', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4902, '4313805', 'Palmitinho', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4903, '4313904', 'Panambi', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4904, '4313953', 'Pantano Grande', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4905, '4314001', 'Parai', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4906, '4314027', 'Paraiso do Sul', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4907, '4314035', 'Pareci Novo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4908, '4314050', 'Parobe', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4909, '4314068', 'Passa Sete', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4910, '4314076', 'Passo do Sobrado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4911, '4314100', 'Passo Fundo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4912, '4314134', 'Paulo Bento', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4913, '4314159', 'Paverama', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4914, '4314175', 'Pedras Altas', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4915, '4314209', 'Pedro Osorio', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4916, '4314308', 'Pejuçara', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4917, '4314407', 'Pelotas', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4918, '4314423', 'Picada Cafe', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4919, '4314456', 'Pinhal', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4920, '4314464', 'Pinhal da Serra', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4921, '4314472', 'Pinhal Grande', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4922, '4314498', 'Pinheirinho do Vale', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4923, '4314506', 'Pinheiro Machado', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4924, '4314548', 'Pinto Bandeira', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4925, '4314555', 'Pirapo', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4926, '4314605', 'Piratini', 'RS', '2023-05-05 12:53:33', '2023-05-05 12:53:33'),
(4927, '4314704', 'Planalto', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4928, '4314753', 'Poço das Antas', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4929, '4314779', 'Pontao', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4930, '4314787', 'Ponte Preta', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4931, '4314803', 'Portao', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4932, '4314902', 'Porto Alegre', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4933, '4315008', 'Porto Lucena', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4934, '4315057', 'Porto Maua', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4935, '4315073', 'Porto Vera Cruz', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4936, '4315107', 'Porto Xavier', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4937, '4315131', 'Pouso Novo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4938, '4315149', 'Presidente Lucena', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4939, '4315156', 'Progresso', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4940, '4315172', 'Protasio Alves', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4941, '4315206', 'Putinga', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4942, '4315305', 'Quarai', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4943, '4315313', 'Quatro Irmaos', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4944, '4315321', 'Quevedos', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4945, '4315354', 'Quinze de Novembro', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4946, '4315404', 'Redentora', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4947, '4315453', 'Relvado', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4948, '4315503', 'Restinga Seca', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4949, '4315552', 'Rio dos indios', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4950, '4315602', 'Rio Grande', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4951, '4315701', 'Rio Pardo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4952, '4315750', 'Riozinho', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4953, '4315800', 'Roca Sales', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4954, '4315909', 'Rodeio Bonito', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4955, '4315958', 'Rolador', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4956, '4316006', 'Rolante', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4957, '4316105', 'Ronda Alta', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4958, '4316204', 'Rondinha', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4959, '4316303', 'Roque Gonzales', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4960, '4316402', 'Rosario do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4961, '4316428', 'Sagrada Familia', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4962, '4316436', 'Saldanha Marinho', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4963, '4316451', 'Salto do Jacui', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4964, '4316477', 'Salvador das Missoes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4965, '4316501', 'Salvador do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4966, '4316600', 'Sananduva', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4967, '4316709', 'Santa Barbara do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4968, '4316733', 'Santa Cecilia do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4969, '4316758', 'Santa Clara do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4970, '4316808', 'Santa Cruz do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4971, '4316907', 'Santa Maria', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4972, '4316956', 'Santa Maria do Herval', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4973, '4316972', 'Santa Margarida do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4974, '4317004', 'Santana da Boa Vista', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4975, '4317103', 'Sant\'Ana do Livramento', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4976, '4317202', 'Santa Rosa', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4977, '4317251', 'Santa Tereza', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4978, '4317301', 'Santa Vitoria do Palmar', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4979, '4317400', 'Santiago', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4980, '4317509', 'Santo Ângelo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4981, '4317558', 'Santo Antônio do Palma', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4982, '4317608', 'Santo Antônio da Patrulha', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4983, '4317707', 'Santo Antônio das Missoes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4984, '4317756', 'Santo Antônio do Planalto', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4985, '4317806', 'Santo Augusto', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4986, '4317905', 'Santo Cristo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4987, '4317954', 'Santo Expedito do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4988, '4318002', 'Sao Borja', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4989, '4318051', 'Sao Domingos do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4990, '4318101', 'Sao Francisco de Assis', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4991, '4318200', 'Sao Francisco de Paula', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4992, '4318309', 'Sao Gabriel', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4993, '4318408', 'Sao Jerônimo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4994, '4318424', 'Sao Joao da Urtiga', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4995, '4318432', 'Sao Joao do Polêsine', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4996, '4318440', 'Sao Jorge', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4997, '4318457', 'Sao Jose das Missoes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4998, '4318465', 'Sao Jose do Herval', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(4999, '4318481', 'Sao Jose do Hortêncio', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5000, '4318499', 'Sao Jose do Inhacora', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5001, '4318507', 'Sao Jose do Norte', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5002, '4318606', 'Sao Jose do Ouro', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5003, '4318614', 'Sao Jose do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5004, '4318622', 'Sao Jose dos Ausentes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5005, '4318705', 'Sao Leopoldo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5006, '4318804', 'Sao Lourenço do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5007, '4318903', 'Sao Luiz Gonzaga', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5008, '4319000', 'Sao Marcos', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5009, '4319109', 'Sao Martinho', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5010, '4319125', 'Sao Martinho da Serra', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5011, '4319158', 'Sao Miguel das Missoes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5012, '4319208', 'Sao Nicolau', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5013, '4319307', 'Sao Paulo das Missoes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5014, '4319356', 'Sao Pedro da Serra', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5015, '4319364', 'Sao Pedro das Missoes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5016, '4319372', 'Sao Pedro do Butia', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5017, '4319406', 'Sao Pedro do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5018, '4319505', 'Sao Sebastiao do Cai', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5019, '4319604', 'Sao Sepe', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5020, '4319703', 'Sao Valentim', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5021, '4319711', 'Sao Valentim do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5022, '4319737', 'Sao Valerio do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5023, '4319752', 'Sao Vendelino', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5024, '4319802', 'Sao Vicente do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5025, '4319901', 'Sapiranga', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5026, '4320008', 'Sapucaia do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5027, '4320107', 'Sarandi', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5028, '4320206', 'Seberi', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5029, '4320230', 'Sede Nova', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5030, '4320263', 'Segredo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5031, '4320305', 'Selbach', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5032, '4320321', 'Senador Salgado Filho', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5033, '4320354', 'Sentinela do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5034, '4320404', 'Serafina Corrêa', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5035, '4320453', 'Serio', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5036, '4320503', 'Sertao', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5037, '4320552', 'Sertao Santana', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5038, '4320578', 'Sete de Setembro', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5039, '4320602', 'Severiano de Almeida', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5040, '4320651', 'Silveira Martins', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5041, '4320677', 'Sinimbu', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5042, '4320701', 'Sobradinho', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5043, '4320800', 'Soledade', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5044, '4320859', 'Tabai', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5045, '4320909', 'Tapejara', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5046, '4321006', 'Tapera', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5047, '4321105', 'Tapes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5048, '4321204', 'Taquara', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5049, '4321303', 'Taquari', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5050, '4321329', 'Taquaruçu do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5051, '4321352', 'Tavares', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5052, '4321402', 'Tenente Portela', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5053, '4321436', 'Terra de Areia', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5054, '4321451', 'Teutônia', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5055, '4321469', 'Tio Hugo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5056, '4321477', 'Tiradentes do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5057, '4321493', 'Toropi', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5058, '4321501', 'Torres', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5059, '4321600', 'Tramandai', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5060, '4321626', 'Travesseiro', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5061, '4321634', 'Três Arroios', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5062, '4321667', 'Três Cachoeiras', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5063, '4321709', 'Três Coroas', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5064, '4321808', 'Três de Maio', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5065, '4321832', 'Três Forquilhas', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5066, '4321857', 'Três Palmeiras', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5067, '4321907', 'Três Passos', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5068, '4321956', 'Trindade do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5069, '4322004', 'Triunfo', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5070, '4322103', 'Tucunduva', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5071, '4322152', 'Tunas', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5072, '4322186', 'Tupanci do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5073, '4322202', 'Tupancireta', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5074, '4322251', 'Tupandi', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5075, '4322301', 'Tuparendi', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5076, '4322327', 'Turuçu', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5077, '4322343', 'Ubiretama', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5078, '4322350', 'Uniao da Serra', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5079, '4322376', 'Unistalda', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5080, '4322400', 'Uruguaiana', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5081, '4322509', 'Vacaria', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5082, '4322525', 'Vale Verde', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5083, '4322533', 'Vale do Sol', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5084, '4322541', 'Vale Real', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5085, '4322558', 'Vanini', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5086, '4322608', 'Venâncio Aires', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5087, '4322707', 'Vera Cruz', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5088, '4322806', 'Veranopolis', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5089, '4322855', 'Vespasiano Correa', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5090, '4322905', 'Viadutos', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5091, '4323002', 'Viamao', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5092, '4323101', 'Vicente Dutra', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5093, '4323200', 'Victor Graeff', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5094, '4323309', 'Vila Flores', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5095, '4323358', 'Vila Lângaro', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5096, '4323408', 'Vila Maria', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5097, '4323457', 'Vila Nova do Sul', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5098, '4323507', 'Vista Alegre', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5099, '4323606', 'Vista Alegre do Prata', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5100, '4323705', 'Vista Gaucha', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5101, '4323754', 'Vitoria das Missoes', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5102, '4323770', 'Westfalia', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5103, '4323804', 'Xangri-la', 'RS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5104, '5000203', 'agua Clara', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5105, '5000252', 'Alcinopolis', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5106, '5000609', 'Amambai', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5107, '5000708', 'Anastacio', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5108, '5000807', 'Anaurilândia', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5109, '5000856', 'Angelica', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5110, '5000906', 'Antônio Joao', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5111, '5001003', 'Aparecida do Taboado', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5112, '5001102', 'Aquidauana', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5113, '5001243', 'Aral Moreira', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5114, '5001508', 'Bandeirantes', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5115, '5001904', 'Bataguassu', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5116, '5002001', 'Bataypora', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5117, '5002100', 'Bela Vista', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5118, '5002159', 'Bodoquena', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5119, '5002209', 'Bonito', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5120, '5002308', 'Brasilândia', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5121, '5002407', 'Caarapo', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5122, '5002605', 'Camapua', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5123, '5002704', 'Campo Grande', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5124, '5002803', 'Caracol', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5125, '5002902', 'Cassilândia', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5126, '5002951', 'Chapadao do Sul', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5127, '5003108', 'Corguinho', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5128, '5003157', 'Coronel Sapucaia', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5129, '5003207', 'Corumba', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5130, '5003256', 'Costa Rica', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5131, '5003306', 'Coxim', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5132, '5003454', 'Deodapolis', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5133, '5003488', 'Dois Irmaos do Buriti', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5134, '5003504', 'Douradina', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5135, '5003702', 'Dourados', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5136, '5003751', 'Eldorado', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5137, '5003801', 'Fatima do Sul', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5138, '5003900', 'Figueirao', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5139, '5004007', 'Gloria de Dourados', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5140, '5004106', 'Guia Lopes da Laguna', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5141, '5004304', 'Iguatemi', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5142, '5004403', 'Inocência', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5143, '5004502', 'Itapora', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5144, '5004601', 'Itaquirai', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5145, '5004700', 'Ivinhema', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5146, '5004809', 'Japora', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5147, '5004908', 'Jaraguari', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5148, '5005004', 'Jardim', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5149, '5005103', 'Jatei', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5150, '5005152', 'Juti', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5151, '5005202', 'Ladario', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5152, '5005251', 'Laguna Carapa', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5153, '5005400', 'Maracaju', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5154, '5005608', 'Miranda', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5155, '5005681', 'Mundo Novo', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5156, '5005707', 'Navirai', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5157, '5005806', 'Nioaque', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5158, '5006002', 'Nova Alvorada do Sul', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5159, '5006200', 'Nova Andradina', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5160, '5006259', 'Novo Horizonte do Sul', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5161, '5006275', 'Paraiso das aguas', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5162, '5006309', 'Paranaiba', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5163, '5006358', 'Paranhos', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5164, '5006408', 'Pedro Gomes', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5165, '5006606', 'Ponta Pora', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5166, '5006903', 'Porto Murtinho', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5167, '5007109', 'Ribas do Rio Pardo', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5168, '5007208', 'Rio Brilhante', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5169, '5007307', 'Rio Negro', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5170, '5007406', 'Rio Verde de Mato Grosso', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5171, '5007505', 'Rochedo', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5172, '5007554', 'Santa Rita do Pardo', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5173, '5007695', 'Sao Gabriel do Oeste', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5174, '5007703', 'Sete Quedas', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5175, '5007802', 'Selviria', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5176, '5007901', 'Sidrolândia', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5177, '5007935', 'Sonora', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5178, '5007950', 'Tacuru', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5179, '5007976', 'Taquarussu', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5180, '5008008', 'Terenos', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5181, '5008305', 'Três Lagoas', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5182, '5008404', 'Vicentina', 'MS', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5183, '5100102', 'Acorizal', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5184, '5100201', 'agua Boa', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5185, '5100250', 'Alta Floresta', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5186, '5100300', 'Alto Araguaia', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5187, '5100359', 'Alto Boa Vista', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5188, '5100409', 'Alto Garças', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5189, '5100508', 'Alto Paraguai', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5190, '5100607', 'Alto Taquari', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5191, '5100805', 'Apiacas', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5192, '5101001', 'Araguaiana', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5193, '5101209', 'Araguainha', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5194, '5101258', 'Araputanga', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5195, '5101308', 'Arenapolis', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5196, '5101407', 'Aripuana', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5197, '5101605', 'Barao de Melgaço', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5198, '5101704', 'Barra do Bugres', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5199, '5101803', 'Barra do Garças', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5200, '5101852', 'Bom Jesus do Araguaia', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5201, '5101902', 'Brasnorte', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5202, '5102504', 'Caceres', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5203, '5102603', 'Campinapolis', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5204, '5102637', 'Campo Novo do Parecis', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5205, '5102678', 'Campo Verde', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5206, '5102686', 'Campos de Julio', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5207, '5102694', 'Canabrava do Norte', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5208, '5102702', 'Canarana', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5209, '5102793', 'Carlinda', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5210, '5102850', 'Castanheira', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5211, '5103007', 'Chapada dos Guimaraes', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5212, '5103056', 'Claudia', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5213, '5103106', 'Cocalinho', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5214, '5103205', 'Colider', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5215, '5103254', 'Colniza', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5216, '5103304', 'Comodoro', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5217, '5103353', 'Confresa', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5218, '5103361', 'Conquista D\'Oeste', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5219, '5103379', 'Cotriguaçu', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5220, '5103403', 'Cuiaba', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5221, '5103437', 'Curvelândia', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5222, '5103452', 'Denise', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5223, '5103502', 'Diamantino', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5224, '5103601', 'Dom Aquino', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5225, '5103700', 'Feliz Natal', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5226, '5103809', 'Figueiropolis D\'Oeste', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5227, '5103858', 'Gaucha do Norte', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5228, '5103908', 'General Carneiro', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5229, '5103957', 'Gloria D\'Oeste', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5230, '5104104', 'Guaranta do Norte', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5231, '5104203', 'Guiratinga', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5232, '5104500', 'Indiavai', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5233, '5104526', 'Ipiranga do Norte', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5234, '5104542', 'Itanhanga', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5235, '5104559', 'Itauba', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5236, '5104609', 'Itiquira', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5237, '5104807', 'Jaciara', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5238, '5104906', 'Jangada', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5239, '5105002', 'Jauru', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5240, '5105101', 'Juara', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5241, '5105150', 'Juina', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5242, '5105176', 'Juruena', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5243, '5105200', 'Juscimeira', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5244, '5105234', 'Lambari D\'Oeste', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5245, '5105259', 'Lucas do Rio Verde', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5246, '5105309', 'Luciara', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5247, '5105507', 'Vila Bela da Santissima Trindade', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5248, '5105580', 'Marcelândia', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5249, '5105606', 'Matupa', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5250, '5105622', 'Mirassol D\'Oeste', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5251, '5105903', 'Nobres', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5252, '5106000', 'Nortelândia', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5253, '5106109', 'Nossa Senhora do Livramento', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5254, '5106158', 'Nova Bandeirantes', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5255, '5106174', 'Nova Nazare', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5256, '5106182', 'Nova Lacerda', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5257, '5106190', 'Nova Santa Helena', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5258, '5106208', 'Nova Brasilândia', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5259, '5106216', 'Nova Canaa do Norte', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5260, '5106224', 'Nova Mutum', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5261, '5106232', 'Nova Olimpia', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5262, '5106240', 'Nova Ubirata', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5263, '5106257', 'Nova Xavantina', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5264, '5106265', 'Novo Mundo', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5265, '5106273', 'Novo Horizonte do Norte', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5266, '5106281', 'Novo Sao Joaquim', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5267, '5106299', 'Paranaita', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5268, '5106307', 'Paranatinga', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5269, '5106315', 'Novo Santo Antônio', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5270, '5106372', 'Pedra Preta', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5271, '5106422', 'Peixoto de Azevedo', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5272, '5106455', 'Planalto da Serra', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5273, '5106505', 'Pocone', 'MT', '2023-05-05 12:53:34', '2023-05-05 12:53:34'),
(5274, '5106653', 'Pontal do Araguaia', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5275, '5106703', 'Ponte Branca', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5276, '5106752', 'Pontes e Lacerda', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5277, '5106778', 'Porto Alegre do Norte', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5278, '5106802', 'Porto dos Gauchos', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5279, '5106828', 'Porto Esperidiao', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5280, '5106851', 'Porto Estrela', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5281, '5107008', 'Poxoreo', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5282, '5107040', 'Primavera do Leste', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5283, '5107065', 'Querência', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5284, '5107107', 'Sao Jose dos Quatro Marcos', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5285, '5107156', 'Reserva do Cabaçal', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5286, '5107180', 'Ribeirao Cascalheira', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5287, '5107198', 'Ribeiraozinho', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5288, '5107206', 'Rio Branco', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5289, '5107248', 'Santa Carmem', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5290, '5107263', 'Santo Afonso', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5291, '5107297', 'Sao Jose do Povo', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5292, '5107305', 'Sao Jose do Rio Claro', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5293, '5107354', 'Sao Jose do Xingu', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5294, '5107404', 'Sao Pedro da Cipa', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5295, '5107578', 'Rondolândia', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5296, '5107602', 'Rondonopolis', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5297, '5107701', 'Rosario Oeste', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5298, '5107743', 'Santa Cruz do Xingu', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5299, '5107750', 'Salto do Ceu', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5300, '5107768', 'Santa Rita do Trivelato', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5301, '5107776', 'Santa Terezinha', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5302, '5107792', 'Santo Antônio do Leste', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5303, '5107800', 'Santo Antônio do Leverger', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5304, '5107859', 'Sao Felix do Araguaia', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5305, '5107875', 'Sapezal', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5306, '5107883', 'Serra Nova Dourada', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5307, '5107909', 'Sinop', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5308, '5107925', 'Sorriso', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5309, '5107941', 'Tabapora', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5310, '5107958', 'Tangara da Serra', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5311, '5108006', 'Tapurah', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5312, '5108055', 'Terra Nova do Norte', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5313, '5108105', 'Tesouro', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5314, '5108204', 'Torixoreu', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5315, '5108303', 'Uniao do Sul', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5316, '5108352', 'Vale de Sao Domingos', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5317, '5108402', 'Varzea Grande', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5318, '5108501', 'Vera', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(5319, '5108600', 'Vila Rica', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5320, '5108808', 'Nova Guarita', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5321, '5108857', 'Nova Marilândia', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5322, '5108907', 'Nova Maringa', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5323, '5108956', 'Nova Monte Verde', 'MT', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5324, '5200050', 'Abadia de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5325, '5200100', 'Abadiânia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5326, '5200134', 'Acreuna', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5327, '5200159', 'Adelândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5328, '5200175', 'agua Fria de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5329, '5200209', 'agua Limpa', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5330, '5200258', 'aguas Lindas de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5331, '5200308', 'Alexânia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5332, '5200506', 'Aloândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5333, '5200555', 'Alto Horizonte', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5334, '5200605', 'Alto Paraiso de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5335, '5200803', 'Alvorada do Norte', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5336, '5200829', 'Amaralina', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5337, '5200852', 'Americano do Brasil', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5338, '5200902', 'Amorinopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5339, '5201108', 'Anapolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5340, '5201207', 'Anhanguera', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5341, '5201306', 'Anicuns', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5342, '5201405', 'Aparecida de Goiânia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5343, '5201454', 'Aparecida do Rio Doce', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5344, '5201504', 'Apore', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5345, '5201603', 'Araçu', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5346, '5201702', 'Aragarças', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5347, '5201801', 'Aragoiânia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5348, '5202155', 'Araguapaz', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5349, '5202353', 'Arenopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5350, '5202502', 'Aruana', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5351, '5202601', 'Aurilândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5352, '5202809', 'Avelinopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5353, '5203104', 'Baliza', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5354, '5203203', 'Barro Alto', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5355, '5203302', 'Bela Vista de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5356, '5203401', 'Bom Jardim de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5357, '5203500', 'Bom Jesus de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5358, '5203559', 'Bonfinopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5359, '5203575', 'Bonopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5360, '5203609', 'Brazabrantes', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5361, '5203807', 'Britânia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5362, '5203906', 'Buriti Alegre', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5363, '5203939', 'Buriti de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5364, '5203962', 'Buritinopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5365, '5204003', 'Cabeceiras', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5366, '5204102', 'Cachoeira Alta', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5367, '5204201', 'Cachoeira de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5368, '5204250', 'Cachoeira Dourada', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5369, '5204300', 'Caçu', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5370, '5204409', 'Caiapônia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5371, '5204508', 'Caldas Novas', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5372, '5204557', 'Caldazinha', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5373, '5204607', 'Campestre de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5374, '5204656', 'Campinaçu', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5375, '5204706', 'Campinorte', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5376, '5204805', 'Campo Alegre de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5377, '5204854', 'Campo Limpo de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5378, '5204904', 'Campos Belos', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5379, '5204953', 'Campos Verdes', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5380, '5205000', 'Carmo do Rio Verde', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5381, '5205059', 'Castelândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5382, '5205109', 'Catalao', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5383, '5205208', 'Caturai', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5384, '5205307', 'Cavalcante', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5385, '5205406', 'Ceres', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5386, '5205455', 'Cezarina', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5387, '5205471', 'Chapadao do Ceu', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5388, '5205497', 'cidades Ocidental', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5389, '5205513', 'Cocalzinho de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5390, '5205521', 'Colinas do Sul', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5391, '5205703', 'Corrego do Ouro', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5392, '5205802', 'Corumba de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5393, '5205901', 'Corumbaiba', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5394, '5206206', 'Cristalina', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5395, '5206305', 'Cristianopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5396, '5206404', 'Crixas', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5397, '5206503', 'Crominia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5398, '5206602', 'Cumari', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5399, '5206701', 'Damianopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5400, '5206800', 'Damolândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5401, '5206909', 'Davinopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5402, '5207105', 'Diorama', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5403, '5207253', 'Doverlândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5404, '5207352', 'Edealina', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5405, '5207402', 'Edeia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5406, '5207501', 'Estrela do Norte', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5407, '5207535', 'Faina', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5408, '5207600', 'Fazenda Nova', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5409, '5207808', 'Firminopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5410, '5207907', 'Flores de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5411, '5208004', 'Formosa', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5412, '5208103', 'Formoso', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5413, '5208152', 'Gameleira de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5414, '5208301', 'Divinopolis de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5415, '5208400', 'Goianapolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5416, '5208509', 'Goiandira', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5417, '5208608', 'Goianesia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5418, '5208707', 'Goiânia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5419, '5208806', 'Goianira', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5420, '5208905', 'Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5421, '5209101', 'Goiatuba', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5422, '5209150', 'Gouvelândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5423, '5209200', 'Guapo', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5424, '5209291', 'Guaraita', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5425, '5209408', 'Guarani de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5426, '5209457', 'Guarinos', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5427, '5209606', 'Heitorai', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5428, '5209705', 'Hidrolândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5429, '5209804', 'Hidrolina', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5430, '5209903', 'Iaciara', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5431, '5209937', 'Inaciolândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5432, '5209952', 'Indiara', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5433, '5210000', 'Inhumas', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5434, '5210109', 'Ipameri', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5435, '5210158', 'Ipiranga de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5436, '5210208', 'Ipora', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5437, '5210307', 'Israelândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5438, '5210406', 'Itaberai', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5439, '5210562', 'Itaguari', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5440, '5210604', 'Itaguaru', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5441, '5210802', 'Itaja', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5442, '5210901', 'Itapaci', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5443, '5211008', 'Itapirapua', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5444, '5211206', 'Itapuranga', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5445, '5211305', 'Itaruma', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5446, '5211404', 'Itauçu', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5447, '5211503', 'Itumbiara', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5448, '5211602', 'Ivolândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5449, '5211701', 'Jandaia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5450, '5211800', 'Jaragua', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5451, '5211909', 'Jatai', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5452, '5212006', 'Jaupaci', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5453, '5212055', 'Jesupolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5454, '5212105', 'Joviânia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5455, '5212204', 'Jussara', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5456, '5212253', 'Lagoa Santa', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5457, '5212303', 'Leopoldo de Bulhoes', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5458, '5212501', 'Luziânia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5459, '5212600', 'Mairipotaba', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5460, '5212709', 'Mambai', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5461, '5212808', 'Mara Rosa', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5462, '5212907', 'Marzagao', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5463, '5212956', 'Matrincha', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5464, '5213004', 'Maurilândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5465, '5213053', 'Mimoso de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5466, '5213087', 'Minaçu', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5467, '5213103', 'Mineiros', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5468, '5213400', 'Moipora', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5469, '5213509', 'Monte Alegre de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5470, '5213707', 'Montes Claros de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5471, '5213756', 'Montividiu', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5472, '5213772', 'Montividiu do Norte', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5473, '5213806', 'Morrinhos', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5474, '5213855', 'Morro Agudo de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5475, '5213905', 'Mossâmedes', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5476, '5214002', 'Mozarlândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5477, '5214051', 'Mundo Novo', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5478, '5214101', 'Mutunopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5479, '5214408', 'Nazario', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5480, '5214507', 'Neropolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5481, '5214606', 'Niquelândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5482, '5214705', 'Nova America', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5483, '5214804', 'Nova Aurora', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5484, '5214838', 'Nova Crixas', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5485, '5214861', 'Nova Gloria', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5486, '5214879', 'Nova Iguaçu de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5487, '5214903', 'Nova Roma', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5488, '5215009', 'Nova Veneza', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5489, '5215207', 'Novo Brasil', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5490, '5215231', 'Novo Gama', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5491, '5215256', 'Novo Planalto', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5492, '5215306', 'Orizona', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5493, '5215405', 'Ouro Verde de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5494, '5215504', 'Ouvidor', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5495, '5215603', 'Padre Bernardo', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5496, '5215652', 'Palestina de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5497, '5215702', 'Palmeiras de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5498, '5215801', 'Palmelo', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5499, '5215900', 'Palminopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5500, '5216007', 'Panama', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5501, '5216304', 'Paranaiguara', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5502, '5216403', 'Parauna', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5503, '5216452', 'Perolândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5504, '5216809', 'Petrolina de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5505, '5216908', 'Pilar de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5506, '5217104', 'Piracanjuba', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5507, '5217203', 'Piranhas', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5508, '5217302', 'Pirenopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5509, '5217401', 'Pires do Rio', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5510, '5217609', 'Planaltina', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5511, '5217708', 'Pontalina', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5512, '5218003', 'Porangatu', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5513, '5218052', 'Porteirao', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5514, '5218102', 'Portelândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5515, '5218300', 'Posse', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5516, '5218391', 'Professor Jamil', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5517, '5218508', 'Quirinopolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5518, '5218607', 'Rialma', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5519, '5218706', 'Rianapolis', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5520, '5218789', 'Rio Quente', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5521, '5218805', 'Rio Verde', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5522, '5218904', 'Rubiataba', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5523, '5219001', 'Sanclerlândia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5524, '5219100', 'Santa Barbara de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5525, '5219209', 'Santa Cruz de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5526, '5219258', 'Santa Fe de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5527, '5219308', 'Santa Helena de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5528, '5219357', 'Santa Isabel', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5529, '5219407', 'Santa Rita do Araguaia', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5530, '5219456', 'Santa Rita do Novo Destino', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5531, '5219506', 'Santa Rosa de Goias', 'GO', '2023-05-05 12:53:35', '2023-05-05 12:53:35'),
(5532, '5219605', 'Santa Tereza de Goias', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5533, '5219704', 'Santa Terezinha de Goias', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5534, '5219712', 'Santo Antônio da Barra', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5535, '5219738', 'Santo Antônio de Goias', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5536, '5219753', 'Santo Antônio do Descoberto', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5537, '5219803', 'Sao Domingos', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5538, '5219902', 'Sao Francisco de Goias', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5539, '5220009', 'Sao Joao D\'Aliança', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5540, '5220058', 'Sao Joao da Parauna', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5541, '5220108', 'Sao Luis de Montes Belos', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5542, '5220157', 'Sao Luiz do Norte', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5543, '5220207', 'Sao Miguel do Araguaia', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5544, '5220264', 'Sao Miguel do Passa Quatro', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5545, '5220280', 'Sao Patricio', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5546, '5220405', 'Sao Simao', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5547, '5220454', 'Senador Canedo', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5548, '5220504', 'Serranopolis', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5549, '5220603', 'Silvânia', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5550, '5220686', 'Simolândia', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5551, '5220702', 'Sitio D\'Abadia', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5552, '5221007', 'Taquaral de Goias', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5553, '5221080', 'Teresina de Goias', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5554, '5221197', 'Terezopolis de Goias', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5555, '5221304', 'Três Ranchos', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5556, '5221403', 'Trindade', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5557, '5221452', 'Trombas', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5558, '5221502', 'Turvânia', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5559, '5221551', 'Turvelândia', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5560, '5221577', 'Uirapuru', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5561, '5221601', 'Uruaçu', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5562, '5221700', 'Uruana', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5563, '5221809', 'Urutai', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5564, '5221858', 'Valparaiso de Goias', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5565, '5221908', 'Varjao', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5566, '5222005', 'Vianopolis', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5567, '5222054', 'Vicentinopolis', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5568, '5222203', 'Vila Boa', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5569, '5222302', 'Vila Propicio', 'GO', '2023-05-05 12:53:36', '2023-05-05 12:53:36'),
(5570, '5300108', 'Brasilia', 'DF', '2023-05-05 12:53:36', '2023-05-05 12:53:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ciots`
--

CREATE TABLE `ciots` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie_rg` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `consumidor_final` int(11) NOT NULL,
  `contribuinte` int(11) NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `limite_venda` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rua_cobranca` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_cobranca` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro_cobranca` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_cobranca` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_cobranca_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `razao_social`, `nome_fantasia`, `cpf_cnpj`, `rua`, `ie_rg`, `numero`, `bairro`, `telefone`, `celular`, `email`, `cep`, `consumidor_final`, `contribuinte`, `cidade_id`, `limite_venda`, `rua_cobranca`, `numero_cobranca`, `bairro_cobranca`, `cep_cobranca`, `cidade_cobranca_id`, `created_at`, `updated_at`) VALUES
(1, 'ANDERSON ALVARENGA', '', '108.445.256-18', 'RUA JULIO RODRIGUES DE MIRANDA', 'ISENTO', '61', 'CONFISCO', '', '', 'andersontfc@gmail.com', '31360-610', 1, 1, 2310, '0.00', '', '', '', '', 2310, '2023-05-29 18:40:08', '2023-05-30 13:35:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_deliveries`
--

CREATE TABLE `cliente_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` int(11) NOT NULL,
  `data_token` timestamp NOT NULL DEFAULT current_timestamp(),
  `ativo` tinyint(1) NOT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_ecommerces`
--

CREATE TABLE `cliente_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `codigo_descontos`
--

CREATE TABLE `codigo_descontos` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` int(11) NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `push` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comissao_vendas`
--

CREATE TABLE `comissao_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED DEFAULT NULL,
  `venda_id` int(11) NOT NULL,
  `tabela` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `complemento_deliveries`
--

CREATE TABLE `complemento_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `categoria_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `componente_ctes`
--

CREATE TABLE `componente_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(10) UNSIGNED NOT NULL,
  `fornecedor_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xml_path` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nf` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_emissao` int(11) NOT NULL,
  `estado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `dfe_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `compras`
--

INSERT INTO `compras` (`id`, `fornecedor_id`, `usuario_id`, `observacao`, `xml_path`, `chave`, `nf`, `numero_emissao`, `estado`, `valor`, `desconto`, `dfe_id`, `created_at`, `updated_at`) VALUES
(11, 3, 1, '*', '42230306087184000317550010000922421164085948.xml', '42230306087184000317550010000922421164085948', '92242', 0, 'NOVO', '5.69', '0.00', 0, '2023-05-30 18:18:20', '2023-05-30 18:18:20'),
(12, 2, 1, '*', '32230327449487000140550010000375521000375534.xml', '32230327449487000140550010000375521000375534', '37552', 0, 'NOVO', '5.93', '0.00', 0, '2023-05-30 18:22:07', '2023-05-30 18:22:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_caixas`
--

CREATE TABLE `config_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `finalizar` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reiniciar` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_desconto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_acrescimo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_observacao` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setar_valor_recebido` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_dinheiro` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_debito` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_credito` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_pix` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setar_leitor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_recebido_automatico` tinyint(1) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `impressora_modelo` int(11) NOT NULL DEFAULT 80,
  `modelo_pdv` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_ecommerces`
--

CREATE TABLE `config_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_facebook` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_twiter` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_instagram` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frete_gratis_valor` decimal(10,2) NOT NULL,
  `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionamento` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `politica_privacidade` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_mapa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor_principal` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tema_ecommerce` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_api` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_notas`
--

CREATE TABLE `config_notas` (
  `id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codPais` int(11) NOT NULL,
  `codMun` int(11) NOT NULL,
  `UF` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_CSOSN_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_COFINS_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_PIS_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_IPI_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frete_padrao` int(11) NOT NULL,
  `tipo_pagamento_padrao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nat_op_padrao` int(11) NOT NULL,
  `ambiente` int(11) NOT NULL,
  `cUF` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_serie_nfe` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_serie_nfce` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_numero_nfe` int(11) NOT NULL,
  `ultimo_numero_nfce` int(11) NOT NULL,
  `ultimo_numero_cte` int(11) NOT NULL,
  `ultimo_numero_mdfe` int(11) NOT NULL,
  `csc` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csc_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificado_a3` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `config_notas`
--

INSERT INTO `config_notas` (`id`, `razao_social`, `nome_fantasia`, `cnpj`, `ie`, `logradouro`, `numero`, `bairro`, `fone`, `cep`, `pais`, `municipio`, `codPais`, `codMun`, `UF`, `CST_CSOSN_padrao`, `CST_COFINS_padrao`, `CST_PIS_padrao`, `CST_IPI_padrao`, `frete_padrao`, `tipo_pagamento_padrao`, `nat_op_padrao`, `ambiente`, `cUF`, `numero_serie_nfe`, `numero_serie_nfce`, `ultimo_numero_nfe`, `ultimo_numero_nfce`, `ultimo_numero_cte`, `ultimo_numero_mdfe`, `csc`, `csc_id`, `certificado_a3`, `created_at`, `updated_at`) VALUES
(1, 'TIAGO MOURAO DE CARVALHO 05494616630', 'ARENA COMPUTADORES', '37 498 191 0002 54', '0037612350165', 'RUA JOSE CLETO', '200', 'PALMARES', '3 13653-7235', '31160-470', 'BRASIL', 'BELO HORIZONTE', 1058, 3106200, 'MG', '41', '07', '07', '53', 0, '01', 1, 2, '31', '1', '1', 100, 100, 100, 100, '12d4704a16dc5a8be49a110ac59a1945', '000001', 0, '2023-05-29 17:57:38', '2023-05-30 13:51:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato_ecommerces`
--

CREATE TABLE `contato_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato_funcionarios`
--

CREATE TABLE `contato_funcionarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_pagars`
--

CREATE TABLE `conta_pagars` (
  `id` int(10) UNSIGNED NOT NULL,
  `compra_id` int(10) UNSIGNED DEFAULT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL DEFAULT 0.00,
  `date_register` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_vencimento` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `conta_pagars`
--

INSERT INTO `conta_pagars` (`id`, `compra_id`, `categoria_id`, `referencia`, `valor_integral`, `valor_pago`, `date_register`, `data_vencimento`, `data_pagamento`, `status`, `created_at`, `updated_at`) VALUES
(17, 11, 1, 'Parcela 1, da NF 92242', '5800.56', '0.00', '2023-05-30 18:18:21', '2023-03-21', '2023-03-21', 0, '2023-05-30 18:18:21', '2023-05-30 18:18:21'),
(18, 12, 1, 'Parcela 1, da NF 37552', '2175.00', '0.00', '2023-05-30 18:22:10', '2023-04-05', '2023-04-05', 0, '2023-05-30 18:22:10', '2023-05-30 18:22:10'),
(19, 12, 1, 'Parcela 2, da NF 37552', '2175.00', '0.00', '2023-05-30 18:22:10', '2023-05-05', '2023-05-05', 0, '2023-05-30 18:22:10', '2023-05-30 18:22:10'),
(20, 12, 1, 'Parcela 3, da NF 37552', '2175.01', '0.00', '2023-05-30 18:22:11', '2023-06-05', '2023-06-05', 0, '2023-05-30 18:22:11', '2023-05-30 18:22:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_recebers`
--

CREATE TABLE `conta_recebers` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_recebido` decimal(10,2) NOT NULL DEFAULT 0.00,
  `date_register` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_vencimento` date NOT NULL,
  `data_recebimento` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cotacaos`
--

CREATE TABLE `cotacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `fornecedor_id` int(10) UNSIGNED NOT NULL,
  `forma_pagamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsavel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` tinyint(1) NOT NULL,
  `ativa` tinyint(1) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `escolhida` tinyint(1) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `credito_vendas`
--

CREATE TABLE `credito_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ctes`
--

CREATE TABLE `ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `chave_nfe` varchar(450) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remetente_id` int(10) UNSIGNED NOT NULL,
  `destinatario_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `tomador` int(11) NOT NULL,
  `municipio_envio` int(10) UNSIGNED NOT NULL,
  `municipio_inicio` int(10) UNSIGNED NOT NULL,
  `municipio_fim` int(10) UNSIGNED NOT NULL,
  `logradouro_tomador` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_tomador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro_tomador` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_tomador` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipio_tomador` int(10) UNSIGNED DEFAULT NULL,
  `valor_transporte` decimal(10,2) NOT NULL,
  `valor_receber` decimal(10,2) NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `produto_predominante` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_previsata_entrega` date NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_cce` int(11) NOT NULL,
  `cte_numero` int(11) NOT NULL DEFAULT 0,
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `retira` tinyint(1) NOT NULL,
  `detalhes_retira` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_id` int(10) UNSIGNED NOT NULL,
  `tpDoc` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descOutros` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nDoc` int(11) NOT NULL,
  `vDocFisc` decimal(10,2) NOT NULL,
  `globalizado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curtida_produto_ecommerces`
--

CREATE TABLE `curtida_produto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `c_te_descargas`
--

CREATE TABLE `c_te_descargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `delivery_configs`
--

CREATE TABLE `delivery_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `link_face` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_twiteer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_google` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_medio_entrega` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_maximo_cancelamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `nome_exibicao_web` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `politica_privacidade` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_km` decimal(10,2) NOT NULL,
  `entrega_gratis_ate` int(11) NOT NULL,
  `maximo_km_entrega` int(11) NOT NULL,
  `usar_bairros` tinyint(1) NOT NULL,
  `maximo_adicionais` int(11) NOT NULL,
  `maximo_adicionais_pizza` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesa_ctes`
--

CREATE TABLE `despesa_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucaos`
--

CREATE TABLE `devolucaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `fornecedor_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `transportadora_id` int(10) UNSIGNED DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_devolvido` decimal(10,2) NOT NULL,
  `motivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `devolucao_parcial` tinyint(1) NOT NULL,
  `chave_nf_entrada` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nNf` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `vFrete` decimal(10,2) NOT NULL,
  `vDesc` decimal(10,2) NOT NULL,
  `chave_gerada` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_gerado` int(11) NOT NULL,
  `sequencia_cce` int(11) NOT NULL DEFAULT 0,
  `transportadora_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_cidade` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_ie` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_endereco` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_quantidade` decimal(6,2) NOT NULL DEFAULT 0.00,
  `frete_especie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_tipo` int(11) NOT NULL DEFAULT 0,
  `veiculo_placa` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `veiculo_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_peso_bruto` decimal(10,3) NOT NULL DEFAULT 0.000,
  `frete_peso_liquido` decimal(10,3) NOT NULL DEFAULT 0.000,
  `despesa_acessorias` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `divisao_grades`
--

CREATE TABLE `divisao_grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_divisao` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dres`
--

CREATE TABLE `dres` (
  `id` int(10) UNSIGNED NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `observacao` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentual_imposto` decimal(5,2) NOT NULL DEFAULT 0.00,
  `lucro_prejuizo` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dre_categorias`
--

CREATE TABLE `dre_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dre_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_deliveries`
--

CREATE TABLE `endereco_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro_id` int(11) NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_ecommerces`
--

CREATE TABLE `endereco_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamentotxt`
--

CREATE TABLE `equipamentotxt` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `escritorio_contabils`
--

CREATE TABLE `escritorio_contabils` (
  `id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoques`
--

CREATE TABLE `estoques` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor_compra` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `estoques`
--

INSERT INTO `estoques` (`id`, `produto_id`, `quantidade`, `valor_compra`, `created_at`, `updated_at`) VALUES
(1, 1, '2.000', '329.00', '2023-05-29 18:49:57', '2023-05-29 19:14:39'),
(2, 3, '0.000', '39.00', '2023-05-30 14:11:06', '2023-05-30 18:11:05'),
(25, 26, '0.000', '12.00', '2023-05-30 16:55:48', '2023-05-30 18:11:11'),
(27, 28, '0.000', '3000.00', '2023-05-30 18:18:21', '2023-05-30 18:18:21'),
(28, 39, '0.000', '1.10', '2023-05-30 18:22:07', '2023-05-30 18:22:07'),
(29, 38, '0.000', '6.49', '2023-05-30 18:22:07', '2023-05-30 18:22:07'),
(30, 37, '0.000', '8.76', '2023-05-30 18:22:07', '2023-05-30 18:22:07'),
(31, 36, '0.000', '19.99', '2023-05-30 18:22:08', '2023-05-30 18:22:08'),
(32, 35, '0.000', '19.99', '2023-05-30 18:22:08', '2023-05-30 18:22:08'),
(33, 34, '0.000', '19.99', '2023-05-30 18:22:08', '2023-05-30 18:22:08'),
(34, 33, '0.000', '19.99', '2023-05-30 18:22:09', '2023-05-30 18:22:09'),
(35, 32, '0.000', '19.00', '2023-05-30 18:22:09', '2023-05-30 18:22:09'),
(36, 31, '0.000', '59.00', '2023-05-30 18:22:09', '2023-05-30 18:22:09'),
(37, 30, '0.000', '699.99', '2023-05-30 18:22:09', '2023-05-30 18:22:09'),
(38, 29, '0.000', '499.99', '2023-05-30 18:22:10', '2023-05-30 18:22:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fatura_orcamentos`
--

CREATE TABLE `fatura_orcamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `orcamento_id` int(10) UNSIGNED DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedors`
--

CREATE TABLE `fornecedors` (
  `id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie_rg` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `fornecedors`
--

INSERT INTO `fornecedors` (`id`, `razao_social`, `nome_fantasia`, `cpf_cnpj`, `ie_rg`, `rua`, `numero`, `bairro`, `telefone`, `celular`, `email`, `cep`, `cidade_id`, `created_at`, `updated_at`) VALUES
(1, 'Pxt Informatica LTDA', 'Pxt Informatica LTDA', '0.022.483/6300-22', '', 'R, Indianopolis', '846', 'Cachoeirinha', '', '', '', '3113-047', 1, '2023-05-30 14:09:16', '2023-05-30 14:09:16'),
(2, 'HAYOM COMERCIO IMPORTACAO E EXP LTDA', 'HAYOM INFORMATICA', '27.449.487/0001-40', '080883737', 'RODOVIA GOVERNADOR MARIO COVAS', 'S/N', 'PLANALTO DE CARAPINA', ' -', '*', '*', '29162-703', 3167, '2023-05-30 14:23:04', '2023-05-30 18:19:43'),
(3, 'INFOCWB IMPORTAÇÃO E DISTRIBUIÇÃO LTDA', '', '06.087.184/0003-17', '257184937', 'RUA DOMINGOS RAMPELOTTI', '3501', 'SÃO ROQUE', '47 3489-8974', '*', '*', '88317-600', 4437, '2023-05-30 17:50:39', '2023-05-30 18:17:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fretes`
--

CREATE TABLE `fretes` (
  `id` int(10) UNSIGNED NOT NULL,
  `placa` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tipo` int(11) NOT NULL,
  `qtdVolumes` int(11) NOT NULL,
  `numeracaoVolumes` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso_liquido` decimal(8,3) NOT NULL,
  `peso_bruto` decimal(8,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `fretes`
--

INSERT INTO `fretes` (`id`, `placa`, `uf`, `valor`, `tipo`, `qtdVolumes`, `numeracaoVolumes`, `especie`, `peso_liquido`, `peso_bruto`, `created_at`, `updated_at`) VALUES
(1, '', '--', '0.00', 0, 1, '0', '*', '0.000', '0.000', '2023-05-29 18:51:31', '2023-05-29 18:51:31'),
(2, '', '--', '0.00', 0, 1, '0', '*', '0.000', '0.000', '2023-05-29 19:03:14', '2023-05-29 19:03:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionamento_deliveries`
--

CREATE TABLE `funcionamento_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `dia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inicio_expediente` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fim_expediente` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `rg` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `data_registro` date NOT NULL,
  `percentual_comissao` decimal(6,2) NOT NULL DEFAULT 0.00,
  `salario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `rg`, `rua`, `numero`, `bairro`, `telefone`, `celular`, `email`, `data_registro`, `percentual_comissao`, `salario`, `usuario_id`, `created_at`, `updated_at`) VALUES
(1, 'Anderson Santos', '108.445.256-18', '17351082', 'Rua Julio Rodrigues de Miranda', '61', 'Confisco', '3 13498-2615', '31 99237-3300', 'andersonsspi@gmail.com', '2021-05-04', '0.00', '2929.00', NULL, '2023-05-31 12:57:46', '2023-05-31 12:57:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario_os`
--

CREATE TABLE `funcionario_os` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `ordem_servico_id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `funcao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem_produto_ecommerces`
--

CREATE TABLE `imagem_produto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens_produto_deliveries`
--

CREATE TABLE `imagens_produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `informativo_ecommerces`
--

CREATE TABLE `informativo_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `info_descargas`
--

CREATE TABLE `info_descargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `tp_unid_transp` int(11) NOT NULL,
  `id_unid_transp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_agendamentos`
--

CREATE TABLE `item_agendamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `servico_id` int(10) UNSIGNED NOT NULL,
  `agendamento_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_compras`
--

CREATE TABLE `item_compras` (
  `id` int(10) UNSIGNED NOT NULL,
  `compra_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `unidade_compra` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validade` date DEFAULT NULL,
  `cfop_entrada` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `codigo_siad` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `item_compras`
--

INSERT INTO `item_compras` (`id`, `compra_id`, `produto_id`, `quantidade`, `valor_unitario`, `unidade_compra`, `validade`, `cfop_entrada`, `codigo_siad`, `created_at`, `updated_at`) VALUES
(38, 11, 28, '3.00', '1895.61', 'UN', NULL, '2102', '', '2023-05-30 18:18:21', '2023-05-30 18:18:21'),
(39, 12, 39, '12.00', '1.10', 'PCS', NULL, '2102', '', '2023-05-30 18:22:07', '2023-05-30 18:22:07'),
(40, 12, 38, '24.00', '6.49', 'PCS', NULL, '2102', '', '2023-05-30 18:22:07', '2023-05-30 18:22:07'),
(41, 12, 37, '15.00', '8.76', 'PCS', NULL, '2102', '', '2023-05-30 18:22:07', '2023-05-30 18:22:07'),
(42, 12, 36, '50.00', '41.80', 'PCS', NULL, '2102', '', '2023-05-30 18:22:08', '2023-05-30 18:22:08'),
(43, 12, 35, '13.00', '4.99', 'PCS', NULL, '2102', '', '2023-05-30 18:22:08', '2023-05-30 18:22:08'),
(44, 12, 34, '13.00', '4.99', 'PCS', NULL, '2102', '', '2023-05-30 18:22:08', '2023-05-30 18:22:08'),
(45, 12, 33, '13.00', '4.99', 'PCS', NULL, '2102', '', '2023-05-30 18:22:09', '2023-05-30 18:22:09'),
(46, 12, 32, '12.00', '12.47', 'PCS', NULL, '2102', '', '2023-05-30 18:22:09', '2023-05-30 18:22:09'),
(47, 12, 31, '12.00', '14.90', 'PCS', NULL, '2102', '', '2023-05-30 18:22:09', '2023-05-30 18:22:09'),
(48, 12, 30, '3.00', '421.03', 'PCS', NULL, '2102', '', '2023-05-30 18:22:09', '2023-05-30 18:22:09'),
(49, 12, 29, '6.00', '291.86', 'PCS', NULL, '2102', '', '2023-05-30 18:22:10', '2023-05-30 18:22:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_cotacaos`
--

CREATE TABLE `item_cotacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cotacao_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_devolucaos`
--

CREATE TABLE `item_devolucaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cod` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codBarras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_unit` decimal(10,2) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `item_parcial` tinyint(1) NOT NULL,
  `unidade_medida` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perc_icms` decimal(8,2) NOT NULL,
  `perc_pis` decimal(8,2) NOT NULL,
  `perc_cofins` decimal(8,2) NOT NULL,
  `perc_ipi` decimal(8,2) NOT NULL,
  `pRedBC` decimal(8,2) NOT NULL,
  `devolucao_id` int(10) UNSIGNED NOT NULL,
  `vBCSTRet` decimal(8,2) NOT NULL DEFAULT 0.00,
  `vFrete` decimal(8,2) NOT NULL DEFAULT 0.00,
  `modBCST` decimal(8,2) NOT NULL,
  `vBCST` decimal(8,2) NOT NULL,
  `pICMSST` decimal(8,2) NOT NULL,
  `vICMSST` decimal(8,2) NOT NULL,
  `pMVAST` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_dves`
--

CREATE TABLE `item_dves` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero_nfe` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_i_b_t_e_s`
--

CREATE TABLE `item_i_b_t_e_s` (
  `id` int(10) UNSIGNED NOT NULL,
  `ibte_id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacional_federal` decimal(5,2) NOT NULL,
  `importado_federal` decimal(5,2) NOT NULL,
  `estadual` decimal(5,2) NOT NULL,
  `municipal` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_orcamentos`
--

CREATE TABLE `item_orcamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `orcamento_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pack_produto_deliveries`
--

CREATE TABLE `item_pack_produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_delivery_id` int(10) UNSIGNED DEFAULT NULL,
  `pack_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedidos`
--

CREATE TABLE `item_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `tamanho_pizza_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `observacao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `impresso` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido_complemento_deliveries`
--

CREATE TABLE `item_pedido_complemento_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_pedido_id` int(10) UNSIGNED NOT NULL,
  `complemento_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido_complemento_locals`
--

CREATE TABLE `item_pedido_complemento_locals` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_pedido` int(10) UNSIGNED NOT NULL,
  `complemento_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido_deliveries`
--

CREATE TABLE `item_pedido_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `impresso` tinyint(1) NOT NULL DEFAULT 0,
  `quantidade` decimal(8,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamanho_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido_ecommerces`
--

CREATE TABLE `item_pedido_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pizza_pedidos`
--

CREATE TABLE `item_pizza_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_pedido` int(10) UNSIGNED NOT NULL,
  `sabor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pizza_pedido_locals`
--

CREATE TABLE `item_pizza_pedido_locals` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_pedido` int(10) UNSIGNED NOT NULL,
  `sabor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_receitas`
--

CREATE TABLE `item_receitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `receita_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `medida` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_vendas`
--

CREATE TABLE `item_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `item_vendas`
--

INSERT INTO `item_vendas` (`id`, `venda_id`, `produto_id`, `quantidade`, `valor`, `observacao`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1.000', '329.00', '', '2023-05-29 18:51:31', '2023-05-29 18:51:31'),
(2, 2, 1, '1.000', '0.05', '', '2023-05-29 19:03:14', '2023-05-29 19:03:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda_caixas`
--

CREATE TABLE `item_venda_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_caixa_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `item_pedido_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `item_venda_caixas`
--

INSERT INTO `item_venda_caixas` (`id`, `venda_caixa_id`, `produto_id`, `item_pedido_id`, `quantidade`, `valor`, `observacao`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, '1.000', '329.00', '', '2023-05-29 18:56:47', '2023-05-29 18:56:47'),
(2, 2, 1, NULL, '1.000', '329.00', '', '2023-05-29 18:57:31', '2023-05-29 18:57:31'),
(3, 3, 1, NULL, '1.000', '329.00', '', '2023-05-29 18:57:42', '2023-05-29 18:57:42'),
(4, 4, 1, NULL, '1.000', '0.05', '', '2023-05-29 19:14:30', '2023-05-29 19:14:30'),
(5, 5, 1, NULL, '1.000', '0.05', '', '2023-05-29 19:14:39', '2023-05-29 19:14:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `i_b_p_t_s`
--

CREATE TABLE `i_b_p_t_s` (
  `id` int(10) UNSIGNED NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lacre_transportes`
--

CREATE TABLE `lacre_transportes` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lacre_unidade_cargas`
--

CREATE TABLE `lacre_unidade_cargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamento_categorias`
--

CREATE TABLE `lancamento_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_complemento_deliveries`
--

CREATE TABLE `lista_complemento_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `complemento_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_precos`
--

CREATE TABLE `lista_precos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentual_alteracao` decimal(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `manifesta_dves`
--

CREATE TABLE `manifesta_dves` (
  `id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `num_prot` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emissao` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_evento` int(11) NOT NULL,
  `fatura_salva` tinyint(1) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nsu` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mdves`
--

CREATE TABLE `mdves` (
  `id` int(10) UNSIGNED NOT NULL,
  `uf_inicio` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf_fim` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encerrado` tinyint(1) NOT NULL,
  `data_inicio_viagem` date NOT NULL,
  `carga_posterior` tinyint(1) NOT NULL,
  `cnpj_contratante` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_tracao_id` int(10) UNSIGNED NOT NULL,
  `veiculo_reboque_id` int(10) UNSIGNED NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdfe_numero` int(11) NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocolo` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_apolice` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_averbacao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `info_complementar` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_adicional_fisco` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lac_rodo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_emit` int(11) NOT NULL,
  `tp_transp` int(11) NOT NULL,
  `produto_pred_nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_ncm` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_cod_barras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_carrega` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_descarrega` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_carga` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medida_ctes`
--

CREATE TABLE `medida_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `cod_unidade` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_medida` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mercado_configs`
--

CREATE TABLE `mercado_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionamento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_de_produtos` int(11) NOT NULL,
  `total_de_clientes` int(11) NOT NULL,
  `total_de_funcionarios` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mesas`
--

CREATE TABLE `mesas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1730, '2014_10_12_000000_create_usuario_table', 1),
(1731, '2014_10_12_100000_create_password_resets_table', 1),
(1732, '2014_10_12_100000_create_tela_pedidos_table', 1),
(1733, '2019_01_13_074542_create_bairro_deliveries_table', 1),
(1734, '2019_01_14_173256_create_categoria_contas_table', 1),
(1735, '2019_02_05_224101_create_cidades_table', 1),
(1736, '2019_02_10_132730_create_categorias_table', 1),
(1737, '2019_02_10_170842_create_produtos_table', 1),
(1738, '2019_02_10_182200_create_clientes_table', 1),
(1739, '2019_02_11_003750_create_fornecedores_table', 1),
(1740, '2019_02_13_025957_create_ordem_servico_table', 1),
(1741, '2019_02_13_043706_create_compras_table', 1),
(1742, '2019_02_13_043951_create_item_compra_table', 1),
(1743, '2019_02_13_212540_create_estoque_table', 1),
(1744, '2019_03_07_124329_create_transportadoras_table', 1),
(1745, '2019_09_06_132659_create_natureza_operacaos_table', 1),
(1746, '2019_09_06_233629_create_fretes_table', 1),
(1747, '2019_09_07_000028_create_funcionarios_table', 1),
(1748, '2019_09_07_000243_create_contato_funcionarios_table', 1),
(1749, '2019_09_07_000401_create_vendas_table', 1),
(1750, '2019_09_07_000402_create_orcamentos_table', 1),
(1751, '2019_09_07_000602_create_item_vendas_table', 1),
(1752, '2019_09_07_000603_create_item_orcamentos_table', 1),
(1753, '2019_09_07_001421_create_categoria_servicos_table', 1),
(1754, '2019_09_07_001450_create_servicos_table', 1),
(1755, '2019_09_07_001649_create_servico_os_table', 1),
(1756, '2019_09_09_060514_create_relatorio_os_table', 1),
(1757, '2019_09_10_120640_create_funcionario_os_table', 1),
(1758, '2019_09_13_124343_create_conta_pagars_table', 1),
(1759, '2019_09_16_133536_create_receitas_table', 1),
(1760, '2019_09_16_134008_create_item_receitas_table', 1),
(1761, '2019_09_17_104549_create_apontamentos_table', 1),
(1762, '2019_09_18_120307_create_config_notas_table', 1),
(1763, '2019_09_20_072219_create_conta_recebers_table', 1),
(1764, '2019_09_20_190012_create_credito_vendas_table', 1),
(1765, '2019_09_25_221701_create_escritorio_contabils_table', 1),
(1766, '2019_09_27_201804_create_venda_caixas_table', 1),
(1767, '2019_09_27_201839_create_sangria_caixas_table', 1),
(1768, '2019_09_27_202513_create_abertura_caixas_table', 1),
(1769, '2019_10_08_020219_create_cotacaos_table', 1),
(1770, '2019_10_08_020521_create_item_cotacaos_table', 1),
(1771, '2019_11_18_142053_create_cliente_deliveries_table', 1),
(1772, '2019_11_18_173451_create_categoria_produto_deliveries_table', 1),
(1773, '2019_11_18_173545_create_endereco_deliveries_table', 1),
(1774, '2019_11_18_174144_create_delivery_configs_table', 1),
(1775, '2019_11_18_174210_create_tamanho_pizzas_table', 1),
(1776, '2019_11_18_174216_create_produto_deliveries_table', 1),
(1777, '2019_11_18_174216_create_produto_pizzas_table', 1),
(1778, '2019_11_18_174238_create_codigo_descontos_table', 1),
(1779, '2019_11_18_174240_create_pedido_deliveries_table', 1),
(1780, '2019_11_18_174253_create_item_pedido_deliveries_table', 1),
(1781, '2019_11_18_174254_create_item_pizza_pedidos_table', 1),
(1782, '2019_11_18_182024_create_imagens_produto_deliveries_table', 1),
(1783, '2019_11_18_182201_create_funcionamento_deliveries_table', 1),
(1784, '2019_11_24_081143_create_categoria_adicionals_table', 1),
(1785, '2019_11_25_114233_create_complemento_deliveries_table', 1),
(1786, '2019_11_25_115042_create_lista_complemento_deliveries_table', 1),
(1787, '2019_11_25_115947_create_item_pedido_complemento_deliveries_table', 1),
(1788, '2019_12_12_113546_create_veiculos_table', 1),
(1789, '2019_12_12_113547_create_ctes_table', 1),
(1790, '2019_12_12_113840_create_medida_ctes_table', 1),
(1791, '2019_12_14_232910_create_componente_ctes_table', 1),
(1792, '2019_12_19_184011_create_produto_favorito_deliveries_table', 1),
(1793, '2019_12_24_105307_create_tributacaos_table', 1),
(1794, '2019_12_27_081743_create_token_cliente_deliveries_table', 1),
(1795, '2020_01_03_003420_create_mesas_table', 1),
(1796, '2020_01_03_121157_create_certificados_table', 1),
(1797, '2020_01_04_003419_create_pushes_table', 1),
(1798, '2020_01_04_003420_create_pedidos_table', 1),
(1799, '2020_01_04_003421_create_item_pedidos_table', 1),
(1800, '2020_01_04_003422_create_item_venda_caixas_table', 1),
(1801, '2020_01_18_084439_create_item_pizza_pedido_locals_table', 1),
(1802, '2020_01_19_003305_create_item_pedido_complemento_locals_table', 1),
(1803, '2020_01_19_201036_create_categoria_despesa_ctes_table', 1),
(1804, '2020_01_19_201358_create_despesa_ctes_table', 1),
(1805, '2020_01_20_004105_create_receita_ctes_table', 1),
(1806, '2020_02_26_100343_create_token_webs_table', 1),
(1807, '2020_02_27_182503_create_devolucaos_table', 1),
(1808, '2020_02_27_182519_create_item_devolucaos_table', 1),
(1809, '2020_03_01_085359_create_mdves_table', 1),
(1810, '2020_03_02_205916_create_municipio_carregamentos_table', 1),
(1811, '2020_03_02_205937_create_percursos_table', 1),
(1812, '2020_03_03_080744_create_ciots_table', 1),
(1813, '2020_03_03_080847_create_vale_pedagios_table', 1),
(1814, '2020_03_03_081000_create_info_descargas_table', 1),
(1815, '2020_03_03_081214_create_n_fe_descargas_table', 1),
(1816, '2020_03_03_081236_create_c_te_descargas_table', 1),
(1817, '2020_03_03_081412_create_lacre_unidade_cargas_table', 1),
(1818, '2020_03_03_081444_create_unidade_cargas_table', 1),
(1819, '2020_03_03_081503_create_lacre_transportes_table', 1),
(1820, '2020_05_16_002118_create_manifesta_dves_table', 1),
(1821, '2020_05_29_164157_create_pedido_pag_seguros_table', 1),
(1822, '2020_06_18_133755_create_pedido_deletes_table', 1),
(1823, '2020_06_23_095357_create_pack_produto_deliveries_table', 1),
(1824, '2020_06_23_095512_create_item_pack_produto_deliveries_table', 1),
(1825, '2020_06_24_093940_create_mercado_configs_table', 1),
(1826, '2020_06_24_095935_create_banner_mais_vendidos_table', 1),
(1827, '2020_06_24_095959_create_banner_topos_table', 1),
(1828, '2020_07_06_155337_create_fatura_orcamentos_table', 1),
(1829, '2020_08_05_073712_create_lista_precos_table', 1),
(1830, '2020_08_05_074304_create_produto_lista_precos_table', 1),
(1831, '2020_08_19_094151_create_alteracao_estoques_table', 1),
(1832, '2020_09_09_084728_create_pedido_qr_code_clientes_table', 1),
(1833, '2020_09_09_103043_create_item_dves_table', 1),
(1834, '2020_11_16_155356_create_empresas_table', 1),
(1835, '2020_11_22_171953_create_motoboys_table', 1),
(1836, '2020_11_22_172042_create_pedido_motoboys_table', 1),
(1837, '2020_11_24_081612_create_comissao_vendas_table', 1),
(1838, '2020_11_26_081725_create_suprimento_caixas_table', 1),
(1839, '2021_01_24_132506_create_agendamentos_table', 1),
(1840, '2021_01_24_133704_create_item_agendamentos_table', 1),
(1841, '2021_07_12_093843_create_dres_table', 1),
(1842, '2021_07_12_094001_create_dre_categorias_table', 1),
(1843, '2021_07_12_094014_create_lancamento_categorias_table', 1),
(1844, '2021_07_12_094135_create_i_b_p_t_s_table', 1),
(1845, '2021_07_12_094201_create_item_i_b_t_e_s_table', 1),
(1846, '2021_07_19_124531_create_config_ecommerces_table', 1),
(1847, '2021_07_19_124550_create_categoria_produto_ecommerces_table', 1),
(1848, '2021_07_19_124631_create_produto_ecommerces_table', 1),
(1849, '2021_07_19_124649_create_imagem_produto_ecommerces_table', 1),
(1850, '2021_07_19_124703_create_carrossel_ecommerces_table', 1),
(1851, '2021_07_19_124719_create_autor_post_blog_ecommerces_table', 1),
(1852, '2021_07_19_124735_create_categoria_post_blog_ecommerces_table', 1),
(1853, '2021_07_19_124749_create_post_blog_ecommerces_table', 1),
(1854, '2021_07_19_124802_create_contato_ecommerces_table', 1),
(1855, '2021_07_19_124909_create_informativo_ecommerces_table', 1),
(1856, '2021_07_19_124928_create_cliente_ecommerces_table', 1),
(1857, '2021_07_19_124941_create_endereco_ecommerces_table', 1),
(1858, '2021_07_19_124952_create_pedido_ecommerces_table', 1),
(1859, '2021_07_19_125005_create_item_pedido_ecommerces_table', 1),
(1860, '2021_07_19_125033_create_curtida_produto_ecommerces_table', 1),
(1861, '2021_08_12_074523_create_config_caixas_table', 1),
(1862, '2021_10_31_113153_create_divisao_grades_table', 1),
(1863, '2023_05_31_165547_create_equipamentotxt', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `motoboys`
--

CREATE TABLE `motoboys` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone1` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone2` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone3` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rg` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_transporte` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `municipio_carregamentos`
--

CREATE TABLE `municipio_carregamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `natureza_operacaos`
--

CREATE TABLE `natureza_operacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `natureza` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_entrada_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_entrada_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_saida_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_saida_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `natureza_operacaos`
--

INSERT INTO `natureza_operacaos` (`id`, `natureza`, `CFOP_entrada_estadual`, `CFOP_entrada_inter_estadual`, `CFOP_saida_estadual`, `CFOP_saida_inter_estadual`, `created_at`, `updated_at`) VALUES
(1, 'VENDA DE MERCADORIA ADQUIRIDA OU RECEBIDA DE TERCEIROS', '5102', '5102', '5102', '5102', '2023-05-29 18:02:07', '2023-05-29 18:02:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `n_fe_descargas`
--

CREATE TABLE `n_fe_descargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentos`
--

CREATE TABLE `orcamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED DEFAULT NULL,
  `frete_id` int(10) UNSIGNED DEFAULT NULL,
  `transportadora_id` int(10) UNSIGNED DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_enviado` tinyint(1) NOT NULL,
  `validade` date NOT NULL,
  `venda_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_servicos`
--

CREATE TABLE `ordem_servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `estado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pd',
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'av',
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `desconto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_prevista_finalizacao` date NOT NULL DEFAULT '1981-01-01',
  `NfNumero` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `ordem_servicos`
--

INSERT INTO `ordem_servicos` (`id`, `cliente_id`, `usuario_id`, `estado`, `descricao`, `forma_pagamento`, `valor`, `desconto`, `data_registro`, `data_prevista_finalizacao`, `NfNumero`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 'pd', 'Teste descrição', 'av', '360.00', '0.00', '2023-05-31 14:17:15', '1981-01-01', 0, '2023-05-31 14:17:15', '2023-06-02 19:52:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pack_produto_deliveries`
--

CREATE TABLE `pack_produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `comanda` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mesa_id` int(10) UNSIGNED DEFAULT NULL,
  `bairro_id` int(10) UNSIGNED DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desativado` tinyint(1) NOT NULL,
  `referencia_cliete` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mesa_ativa` tinyint(1) NOT NULL DEFAULT 1,
  `fechar_mesa` tinyint(1) NOT NULL DEFAULT 0,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `imprimir` tinyint(1) NOT NULL DEFAULT 0,
  `finalizado_atendimeto` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_deletes`
--

CREATE TABLE `pedido_deletes` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_insercao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_deliveries`
--

CREATE TABLE `pedido_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_total` decimal(10,2) NOT NULL,
  `troco_para` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivoEstado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco_id` int(10) UNSIGNED DEFAULT NULL,
  `cupom_id` int(10) UNSIGNED DEFAULT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `app` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_ecommerces`
--

CREATE TABLE `pedido_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `endereco_id` int(10) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `status_preparacao` int(11) NOT NULL,
  `codigo_rastreio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_total` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `tipo_frete` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_id` int(11) NOT NULL DEFAULT 0,
  `numero_nfe` int(11) NOT NULL DEFAULT 0,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rand_pedido` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_boleto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transacao_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `forma_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status_pagamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status_detalhe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_motoboys`
--

CREATE TABLE `pedido_motoboys` (
  `id` int(10) UNSIGNED NOT NULL,
  `motoboy_id` int(10) UNSIGNED DEFAULT NULL,
  `pedido_id` int(10) UNSIGNED DEFAULT NULL,
  `valor` decimal(7,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `observacao` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_pag_seguros`
--

CREATE TABLE `pedido_pag_seguros` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_delivery_id` int(10) UNSIGNED NOT NULL,
  `numero_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_impresso` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_transacao` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bandeira` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parcelas` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_qr_code_clientes`
--

CREATE TABLE `pedido_qr_code_clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED DEFAULT NULL,
  `hash` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `percursos`
--

CREATE TABLE `percursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `post_blog_ecommerces`
--

CREATE TABLE `post_blog_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `autor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL DEFAULT 0.00,
  `valor_compra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `NCM` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `codBarras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CEST` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_CSOSN` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_PIS` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_COFINS` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_IPI` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unidade_compra` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversao_unitaria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `unidade_venda` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `composto` tinyint(1) NOT NULL DEFAULT 0,
  `valor_livre` tinyint(1) NOT NULL,
  `perc_icms` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_pis` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_cofins` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_ipi` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_iss` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pRedBC` decimal(5,2) NOT NULL DEFAULT 0.00,
  `cBenef` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cListServ` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_saida_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_saida_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_anp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_anp` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perc_glp` decimal(5,2) NOT NULL DEFAULT 0.00,
  `perc_gnn` decimal(5,2) NOT NULL DEFAULT 0.00,
  `perc_gni` decimal(5,2) NOT NULL DEFAULT 0.00,
  `valor_partida` decimal(10,2) NOT NULL DEFAULT 0.00,
  `unidade_tributavel` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quantidade_tributavel` decimal(10,2) NOT NULL DEFAULT 0.00,
  `imagem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alerta_vencimento` int(11) NOT NULL,
  `gerenciar_estoque` tinyint(1) NOT NULL,
  `estoque_minimo` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `referencia_balanca` int(11) NOT NULL DEFAULT 0,
  `tela_id` int(10) UNSIGNED DEFAULT NULL,
  `largura` decimal(6,2) NOT NULL DEFAULT 0.00,
  `comprimento` decimal(6,2) NOT NULL DEFAULT 0.00,
  `altura` decimal(6,2) NOT NULL DEFAULT 0.00,
  `peso_liquido` decimal(8,3) NOT NULL DEFAULT 0.000,
  `peso_bruto` decimal(8,3) NOT NULL DEFAULT 0.000,
  `referencia_grade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `grade` tinyint(1) NOT NULL DEFAULT 0,
  `str_grade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `passageiros` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cor_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `chassi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `combustivel` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `numero_motor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ano` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modelo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `perc_icms_interestadual` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_icms_interno` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_fcp_interestadual` decimal(10,2) NOT NULL DEFAULT 0.00,
  `origem` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `cor`, `categoria_id`, `valor_venda`, `valor_compra`, `NCM`, `codBarras`, `CEST`, `CST_CSOSN`, `CST_PIS`, `CST_COFINS`, `CST_IPI`, `unidade_compra`, `conversao_unitaria`, `unidade_venda`, `composto`, `valor_livre`, `perc_icms`, `perc_pis`, `perc_cofins`, `perc_ipi`, `perc_iss`, `pRedBC`, `cBenef`, `cListServ`, `CFOP_saida_estadual`, `CFOP_saida_inter_estadual`, `codigo_anp`, `descricao_anp`, `perc_glp`, `perc_gnn`, `perc_gni`, `valor_partida`, `unidade_tributavel`, `quantidade_tributavel`, `imagem`, `alerta_vencimento`, `gerenciar_estoque`, `estoque_minimo`, `referencia`, `referencia_balanca`, `tela_id`, `largura`, `comprimento`, `altura`, `peso_liquido`, `peso_bruto`, `referencia_grade`, `grade`, `str_grade`, `passageiros`, `cor_veiculo`, `chassi`, `combustivel`, `numero_motor`, `ano`, `modelo`, `perc_icms_interestadual`, `perc_icms_interno`, `perc_fcp_interestadual`, `origem`, `created_at`, `updated_at`) VALUES
(1, 'Gabinete Hayom GB1709', '--', 1, '0.05', '0.01', '4407.11.00', 'SEM GTIN', '', '101', '07', '07', '53', 'UNID', '1', 'UNID', 0, 0, '0.00', '49.00', '49.00', '99.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 1, 10, 'GB1709', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', 'c30ps7JNc3qTezVZvKIs', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-29 18:38:28', '2023-05-29 19:02:30'),
(3, 'Adaptador Bluetooth 5.0', '--', 1, '69.90', '39.00', '4407.11.00', 'SEM GTIN', '', '101', '07', '07', '53', 'UNID', '1', 'UNID', 0, 0, '0.00', '49.00', '49.00', '99.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 1, 0, 'usb5', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', 'H6fQ7KGLjwe6buEIciDX', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 14:06:08', '2023-05-30 14:06:08'),
(26, 'Cabo de Celular Tipo C Corda no Tubo', '--', 1, '29.90', '12.00', '4407.11.00', 'SEM GTIN', '', '101', '07', '07', '53', 'UNID', '1', 'UNID', 0, 0, '0.00', '49.00', '49.00', '99.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 1, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '3Qt182SFtGlXYEiIk6qR', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 16:53:13', '2023-05-30 16:53:13'),
(28, 'GPU NV RTX3060 8GB PEGASUS GD6 128BITS GAINWARD NE63060019P1-190AE', '--', 1, '3000.00', '1895.61', '85423190', '4710562243451', '', '41', '07', '07', '53', 'UN', 'NaN', 'UNID', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:18:11', '2023-05-30 18:18:21'),
(29, 'MONITOR PARA COMPUTADOR 17,1\" - MO6004', '--', 1, '499.99', '291.86', '8528.52.00', '7899095438897', '', '101', '07', '07', '53', 'UNID', 'NaN', 'GRAMAS', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 1, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:20:05', '2023-05-30 19:23:25'),
(30, 'MONITOR PARA COMPUTADOR 21,5\" - MO6003', '--', 1, '699.99', '421.03', '85285200', '7899095438880', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:20:15', '2023-05-30 18:22:09'),
(31, 'MOUSE GAMER 7D - MU2909', '--', 1, '59.00', '14.90', '84716053', '7899095441552', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:20:29', '2023-05-30 18:22:09'),
(32, 'MOUSE OFFICE - MU2902', '--', 1, '19.00', '12.47', '84716053', '7899095441484', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:20:38', '2023-05-30 18:22:09'),
(33, 'FONE DE OUVIDO COM FIO - FO2815', '--', 1, '19.99', '4.99', '85183000', '7899095441316', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:20:51', '2023-05-30 18:22:09'),
(34, 'FONE DE OUVIDO COM FIO - FO2814', '--', 1, '19.99', '4.99', '85183000', '7899095441309', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:21:30', '2023-05-30 18:22:08'),
(35, 'FONE DE OUVIDO COM FIO - FO2813', '--', 1, '19.99', '4.99', '85183000', '7899095441293', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:21:38', '2023-05-30 18:22:08'),
(36, 'FONTE DE ALIMENTACAO 200W ATX - 110/220V - PW1620', '--', 1, '19.99', '41.80', '85044021', '7899095436947', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:21:50', '2023-05-30 18:22:08'),
(37, 'CABO USB MULTFUNCAO - TIPO C/ IPHONE/MICRO PRETO - CB1120', '--', 1, '0.00', '8.76', '85444200', '7899095435421', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:21:54', '2023-05-30 18:22:07'),
(38, 'CABO USB 2.0 PARA MICRO USB AZUL - CB1117', '--', 1, '0.00', '6.49', '85444200', '7899095435384', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:21:58', '2023-05-30 18:22:07'),
(39, 'EMENDA - CONECTOR E RJ45 - 1 UNIDADE - AI1013', '--', 1, '0.00', '1.10', '85369090', '7899095434820', '', '41', '07', '07', '53', 'PCS', 'NaN', 'AMPOLA', 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '5102', '5102', '', '', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', 0, 0, 0, '', 0, NULL, '0.00', '0.00', '0.00', '0.000', '0.000', '', 0, '', '', '', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '2023-05-30 18:22:02', '2023-05-30 18:22:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_deliveries`
--

CREATE TABLE `produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_anterior` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `auto_atendimento` tinyint(1) NOT NULL DEFAULT 0,
  `destaque` tinyint(1) NOT NULL,
  `limite_diario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_ecommerces`
--

CREATE TABLE `produto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `controlar_estoque` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor` decimal(10,2) NOT NULL,
  `percentual_desconto_view` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_favorito_deliveries`
--

CREATE TABLE `produto_favorito_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_lista_precos`
--

CREATE TABLE `produto_lista_precos` (
  `id` int(10) UNSIGNED NOT NULL,
  `lista_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual_lucro` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_pizzas`
--

CREATE TABLE `produto_pizzas` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `tamanho_id` int(10) UNSIGNED DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pushes`
--

CREATE TABLE `pushes` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_img` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia_produto` int(11) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `receitas`
--

CREATE TABLE `receitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rendimento` double(8,2) NOT NULL,
  `valor_custo` decimal(10,2) NOT NULL,
  `tempo_preparo` int(11) NOT NULL,
  `pizza` tinyint(1) NOT NULL,
  `pedacos` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `receita_ctes`
--

CREATE TABLE `receita_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio_os`
--

CREATE TABLE `relatorio_os` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `ordem_servico_id` int(10) UNSIGNED NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `equipamento` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `problema` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recebimento` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `laudo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rma` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `relatorio_os`
--

INSERT INTO `relatorio_os` (`id`, `usuario_id`, `ordem_servico_id`, `texto`, `data_registro`, `created_at`, `updated_at`, `equipamento`, `problema`, `recebimento`, `laudo`, `rma`) VALUES
(15, 1, 3, 'Pequeno desgaste na lateral, falta um parafuso, arranhões de uso', '2023-06-01 18:42:34', '2023-06-01 18:42:34', '2023-06-02 16:32:21', 'Notebook Asus 520F', 'O notebook parou de ligar após cair refrigerante no teclado, o cliente alega ter esperado secar porém a maquina não ligou mais. Se resolvido orçar um possível upgrade de memória.', 'Notebook com capa e carregador', 'Necessário uma limpeza profunda e a troca do teclado. Reparo na placa também será necessário', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sangria_caixas`
--

CREATE TABLE `sangria_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `unidade_cobranca` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_servico` int(11) NOT NULL,
  `comissao` decimal(6,2) NOT NULL DEFAULT 0.00,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `valor`, `unidade_cobranca`, `tempo_servico`, `comissao`, `categoria_id`, `created_at`, `updated_at`) VALUES
(1, 'Formatação', '110.00', 'HR', 59, '0.00', 1, '2023-05-31 12:53:45', '2023-05-31 12:53:45'),
(2, 'Backup', '50.00', 'HR', 0, '0.00', 1, '2023-05-31 12:54:10', '2023-05-31 12:54:10'),
(3, 'Reparo de Placas', '250.00', 'HR', 0, '0.00', 1, '2023-05-31 12:54:30', '2023-05-31 12:54:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico_os`
--

CREATE TABLE `servico_os` (
  `id` int(10) UNSIGNED NOT NULL,
  `servico_id` int(10) UNSIGNED NOT NULL,
  `ordem_servico_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `servico_os`
--

INSERT INTO `servico_os` (`id`, `servico_id`, `ordem_servico_id`, `quantidade`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 0, '2023-05-31 14:19:27', '2023-05-31 14:19:27'),
(3, 3, 3, 1, 0, '2023-06-02 19:52:29', '2023-06-02 19:52:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `suprimento_caixas`
--

CREATE TABLE `suprimento_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho_pizzas`
--

CREATE TABLE `tamanho_pizzas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedacos` int(11) NOT NULL,
  `maximo_sabores` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tela_pedidos`
--

CREATE TABLE `tela_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alerta_amarelo` int(11) NOT NULL DEFAULT 0,
  `alerta_vermelho` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `token_cliente_deliveries`
--

CREATE TABLE `token_cliente_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `token_webs`
--

CREATE TABLE `token_webs` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportadoras`
--

CREATE TABLE `transportadoras` (
  `id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_cpf` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tributacaos`
--

CREATE TABLE `tributacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `icms` decimal(4,2) NOT NULL,
  `pis` decimal(4,2) NOT NULL,
  `cofins` decimal(4,2) NOT NULL,
  `ipi` decimal(4,2) NOT NULL,
  `ncm_padrao` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000.00.00',
  `regime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tributacaos`
--

INSERT INTO `tributacaos` (`id`, `icms`, `pis`, `cofins`, `ipi`, `ncm_padrao`, `regime`, `created_at`, `updated_at`) VALUES
(1, '0.00', '49.00', '49.00', '99.00', '4407.11.00', '0', '2023-05-29 18:19:24', '2023-05-29 18:19:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade_cargas`
--

CREATE TABLE `unidade_cargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `id_unidade_carga` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adm` tinyint(1) NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL,
  `acesso_cliente` tinyint(1) NOT NULL,
  `acesso_fornecedor` tinyint(1) NOT NULL,
  `acesso_produto` tinyint(1) NOT NULL,
  `acesso_financeiro` tinyint(1) NOT NULL,
  `acesso_caixa` tinyint(1) NOT NULL,
  `acesso_estoque` tinyint(1) NOT NULL,
  `acesso_compra` tinyint(1) NOT NULL,
  `acesso_fiscal` tinyint(1) NOT NULL,
  `venda_nao_fiscal` tinyint(1) NOT NULL,
  `acesso_cte` tinyint(1) NOT NULL,
  `acesso_mdfe` tinyint(1) NOT NULL,
  `tema` int(11) NOT NULL DEFAULT 1,
  `tema_menu` int(11) NOT NULL DEFAULT 1,
  `permissao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `login`, `adm`, `senha`, `img`, `ativo`, `acesso_cliente`, `acesso_fornecedor`, `acesso_produto`, `acesso_financeiro`, `acesso_caixa`, `acesso_estoque`, `acesso_compra`, `acesso_fiscal`, `venda_nao_fiscal`, `acesso_cte`, `acesso_mdfe`, `tema`, `tema_menu`, `permissao`, `created_at`, `updated_at`) VALUES
(1, 'Usuário', 'usuario', 1, '202cb962ac59075b964b07152d234b70', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '[\"\\/categorias\",\"\\/produtos\",\"\\/clientes\",\"\\/fornecedores\",\"\\/transportadoras\",\"\\/funcionarios\",\"\\/categoriasServico\",\"\\/servicos\",\"\\/listaDePrecos\",\"\\/categoriasConta\",\"\\/veiculos\",\"\\/usuarios\",\"\\/compraFiscal\",\"\\/compraManual\",\"\\/compras\",\"\\/cotacao\",\"\\/dfe\",\"\\/estoque\",\"\\/estoque\\/apontamentoProducao\",\"\\/vendas\\/lista\",\"\\/vendas\\/nova\",\"\\/frenteCaixa\",\"\\/orcamentoVenda\",\"\\/ordemServico\",\"\\/vendasEmCredito\",\"\\/devolucao\",\"\\/agendamentos\",\"\\/contasPagar\",\"\\/contasReceber\",\"\\/fluxoCaixa\",\"\\/graficos\",\"\\/pedidos\",\"\\/telasPedido\",\"\\/controleCozinha\\/selecionar\",\"\\/mesas\",\"\\/pedidos\\/controleComandas\",\"\\/cte\",\"\\/cte\\/nova\",\"\\/categoriaDespesa\",\"\\/mdfe\",\"\\/mdfe\\/nova\",\"\\/relatorios\",\"\\/dre\",\"\\/deliveryCategoria\",\"\\/deliveryProduto\",\"\\/deliveryComplemento\",\"\\/bairrosDelivery\",\"\\/pedidosDelivery\",\"\\/pedidosDelivery\\/frente\",\"\\/configDelivery\",\"\\/funcionamentoDelivery\",\"\\/push\",\"\\/tamanhosPizza\",\"\\/motoboys\",\"\\/codigoDesconto\",\"\\/configNF\",\"\\/escritorio\",\"\\/naturezaOperacao\",\"\\/tributos\",\"\\/enviarXml\",\"\\/ibpt\",\"\\/categoriaEcommerce\",\"\\/produtoEcommerce\",\"\\/pedidosEcommerce\",\"\\/configEcommerce\",\"\\/carrosselEcommerce\",\"\\/autorPost\",\"\\/categoriaPosts\",\"\\/postBlog\",\"\\/contatoEcommerce\",\"\\/informativoEcommerce\",\"\\/clienteEcommerce\",\"\\/configEcommerce\\/verSite\"]', '2023-05-05 12:53:20', '2023-05-30 16:15:32');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vale_pedagios`
--

CREATE TABLE `vale_pedagios` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `cnpj_fornecedor` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_fornecedor_pagador` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_compra` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(10) UNSIGNED NOT NULL,
  `placa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rntrc` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_carroceira` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_rodado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tara` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidade` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_ie` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_tp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `frete_id` int(10) UNSIGNED DEFAULT NULL,
  `transportadora_id` int(10) UNSIGNED DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_cce` int(11) NOT NULL,
  `NfNumero` int(11) NOT NULL DEFAULT 0,
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_ecommerce_id` int(11) NOT NULL DEFAULT 0,
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `cliente_id`, `usuario_id`, `natureza_id`, `frete_id`, `transportadora_id`, `data_registro`, `valor_total`, `desconto`, `forma_pagamento`, `tipo_pagamento`, `observacao`, `estado`, `sequencia_cce`, `NfNumero`, `chave`, `path_xml`, `pedido_ecommerce_id`, `bandeira_cartao`, `cnpj_cartao`, `cAut_cartao`, `descricao_pag_outros`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, NULL, '2023-05-29 18:51:31', '329.00', '0.00', 'a_vista', '01', '', 'DISPONIVEL', 0, 0, '', '', 0, '99', '', '', '', '2023-05-29 18:51:31', '2023-05-29 18:51:31'),
(2, 1, 1, 1, 2, NULL, '2023-05-29 19:03:14', '0.05', '0.00', 'a_vista', '01', '', 'APROVADO', 0, 101, '31230537498191000254550010000001011000696842', '31230537498191000254550010000001011000696842.xml', 0, '99', '', '', '', '2023-05-29 19:03:14', '2023-05-30 13:51:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_caixas`
--

CREATE TABLE `venda_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_total` decimal(10,2) NOT NULL,
  `dinheiro_recebido` decimal(10,2) NOT NULL,
  `troco` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NFcNumero` int(11) NOT NULL DEFAULT 0,
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_delivery_id` int(11) NOT NULL,
  `tipo_pagamento_1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_1` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo_pagamento_2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_2` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo_pagamento_3` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_3` decimal(10,2) NOT NULL DEFAULT 0.00,
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `venda_caixas`
--

INSERT INTO `venda_caixas` (`id`, `cliente_id`, `usuario_id`, `natureza_id`, `data_registro`, `valor_total`, `dinheiro_recebido`, `troco`, `desconto`, `acrescimo`, `forma_pagamento`, `tipo_pagamento`, `estado`, `NFcNumero`, `chave`, `path_xml`, `nome`, `cpf`, `observacao`, `pedido_delivery_id`, `tipo_pagamento_1`, `valor_pagamento_1`, `tipo_pagamento_2`, `valor_pagamento_2`, `tipo_pagamento_3`, `valor_pagamento_3`, `bandeira_cartao`, `cnpj_cartao`, `cAut_cartao`, `descricao_pag_outros`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, '2023-05-29 18:56:47', '329.00', '329.00', '0.00', '0.00', '0.00', ' ', '01', 'DISPONIVEL', 0, '', '', '', '', '', 0, '', '0.00', '', '0.00', '', '0.00', '99', '', '', '', '2023-05-29 18:56:47', '2023-05-29 18:56:47'),
(2, NULL, 1, 1, '2023-05-29 18:57:31', '329.00', '329.00', '0.00', '0.00', '0.00', ' ', '01', 'DISPONIVEL', 0, '', '', '', '108.445.256-18', '', 0, '', '0.00', '', '0.00', '', '0.00', '99', '', '', '', '2023-05-29 18:57:31', '2023-05-29 18:57:31'),
(3, NULL, 1, 1, '2023-05-29 18:57:42', '329.00', '329.00', '0.00', '0.00', '0.00', ' ', '01', 'DISPONIVEL', 0, '', '', '', '108.445.256-18', '', 0, '', '0.00', '', '0.00', '', '0.00', '99', '', '', '', '2023-05-29 18:57:42', '2023-05-29 18:57:42'),
(4, NULL, 1, 1, '2023-05-29 19:14:30', '0.05', '0.05', '0.00', '0.00', '0.00', ' ', '01', 'DISPONIVEL', 0, '', '', '', '108.445.256-18', '', 0, '', '0.00', '', '0.00', '', '0.00', '99', '', '', '', '2023-05-29 19:14:30', '2023-05-29 19:14:30'),
(5, NULL, 1, 1, '2023-05-29 19:14:39', '0.05', '0.05', '0.00', '0.00', '0.00', ' ', '01', 'DISPONIVEL', 0, '', '', '', '108.445.256-18', '', 0, '', '0.00', '', '0.00', '', '0.00', '99', '', '', '', '2023-05-29 19:14:39', '2023-05-29 19:14:39');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `abertura_caixas`
--
ALTER TABLE `abertura_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abertura_caixas_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agendamentos_funcionario_id_foreign` (`funcionario_id`),
  ADD KEY `agendamentos_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `alteracao_estoques`
--
ALTER TABLE `alteracao_estoques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alteracao_estoques_produto_id_foreign` (`produto_id`),
  ADD KEY `alteracao_estoques_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `apontamentos`
--
ALTER TABLE `apontamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apontamentos_produto_id_foreign` (`produto_id`),
  ADD KEY `apontamentos_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `autor_post_blog_ecommerces`
--
ALTER TABLE `autor_post_blog_ecommerces`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `bairro_deliveries`
--
ALTER TABLE `bairro_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `banner_mais_vendidos`
--
ALTER TABLE `banner_mais_vendidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_mais_vendidos_produto_delivery_id_foreign` (`produto_delivery_id`),
  ADD KEY `banner_mais_vendidos_pack_id_foreign` (`pack_id`);

--
-- Índices para tabela `banner_topos`
--
ALTER TABLE `banner_topos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_topos_produto_delivery_id_foreign` (`produto_delivery_id`),
  ADD KEY `banner_topos_pack_id_foreign` (`pack_id`);

--
-- Índices para tabela `carrossel_ecommerces`
--
ALTER TABLE `carrossel_ecommerces`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_adicionals`
--
ALTER TABLE `categoria_adicionals`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_contas`
--
ALTER TABLE `categoria_contas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_despesa_ctes`
--
ALTER TABLE `categoria_despesa_ctes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_post_blog_ecommerces`
--
ALTER TABLE `categoria_post_blog_ecommerces`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_produto_deliveries`
--
ALTER TABLE `categoria_produto_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_produto_ecommerces`
--
ALTER TABLE `categoria_produto_ecommerces`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_servicos`
--
ALTER TABLE `categoria_servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ciots`
--
ALTER TABLE `ciots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciots_mdfe_id_foreign` (`mdfe_id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_cidade_id_foreign` (`cidade_id`),
  ADD KEY `clientes_cidade_cobranca_id_foreign` (`cidade_cobranca_id`);

--
-- Índices para tabela `cliente_deliveries`
--
ALTER TABLE `cliente_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente_ecommerces`
--
ALTER TABLE `cliente_ecommerces`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `codigo_descontos`
--
ALTER TABLE `codigo_descontos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_descontos_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `comissao_vendas`
--
ALTER TABLE `comissao_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comissao_vendas_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices para tabela `complemento_deliveries`
--
ALTER TABLE `complemento_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complemento_deliveries_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `componente_ctes`
--
ALTER TABLE `componente_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `componente_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices para tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_fornecedor_id_foreign` (`fornecedor_id`),
  ADD KEY `compras_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `config_caixas`
--
ALTER TABLE `config_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `config_caixas_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `config_ecommerces`
--
ALTER TABLE `config_ecommerces`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `config_notas`
--
ALTER TABLE `config_notas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contato_ecommerces`
--
ALTER TABLE `contato_ecommerces`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contato_funcionarios`
--
ALTER TABLE `contato_funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contato_funcionarios_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices para tabela `conta_pagars`
--
ALTER TABLE `conta_pagars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_pagars_compra_id_foreign` (`compra_id`),
  ADD KEY `conta_pagars_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `conta_recebers`
--
ALTER TABLE `conta_recebers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_recebers_venda_id_foreign` (`venda_id`),
  ADD KEY `conta_recebers_usuario_id_foreign` (`usuario_id`),
  ADD KEY `conta_recebers_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `cotacaos`
--
ALTER TABLE `cotacaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cotacaos_fornecedor_id_foreign` (`fornecedor_id`);

--
-- Índices para tabela `credito_vendas`
--
ALTER TABLE `credito_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credito_vendas_venda_id_foreign` (`venda_id`),
  ADD KEY `credito_vendas_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `ctes`
--
ALTER TABLE `ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ctes_remetente_id_foreign` (`remetente_id`),
  ADD KEY `ctes_destinatario_id_foreign` (`destinatario_id`),
  ADD KEY `ctes_usuario_id_foreign` (`usuario_id`),
  ADD KEY `ctes_natureza_id_foreign` (`natureza_id`),
  ADD KEY `ctes_municipio_envio_foreign` (`municipio_envio`),
  ADD KEY `ctes_municipio_inicio_foreign` (`municipio_inicio`),
  ADD KEY `ctes_municipio_fim_foreign` (`municipio_fim`),
  ADD KEY `ctes_municipio_tomador_foreign` (`municipio_tomador`),
  ADD KEY `ctes_veiculo_id_foreign` (`veiculo_id`);

--
-- Índices para tabela `curtida_produto_ecommerces`
--
ALTER TABLE `curtida_produto_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curtida_produto_ecommerces_produto_id_foreign` (`produto_id`),
  ADD KEY `curtida_produto_ecommerces_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `c_te_descargas`
--
ALTER TABLE `c_te_descargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_te_descargas_info_id_foreign` (`info_id`);

--
-- Índices para tabela `delivery_configs`
--
ALTER TABLE `delivery_configs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `despesa_ctes`
--
ALTER TABLE `despesa_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `despesa_ctes_categoria_id_foreign` (`categoria_id`),
  ADD KEY `despesa_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices para tabela `devolucaos`
--
ALTER TABLE `devolucaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devolucaos_fornecedor_id_foreign` (`fornecedor_id`),
  ADD KEY `devolucaos_usuario_id_foreign` (`usuario_id`),
  ADD KEY `devolucaos_natureza_id_foreign` (`natureza_id`),
  ADD KEY `devolucaos_transportadora_id_foreign` (`transportadora_id`);

--
-- Índices para tabela `divisao_grades`
--
ALTER TABLE `divisao_grades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `dres`
--
ALTER TABLE `dres`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `dre_categorias`
--
ALTER TABLE `dre_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dre_categorias_dre_id_foreign` (`dre_id`);

--
-- Índices para tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `endereco_deliveries`
--
ALTER TABLE `endereco_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `endereco_deliveries_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `endereco_ecommerces`
--
ALTER TABLE `endereco_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `endereco_ecommerces_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `equipamentotxt`
--
ALTER TABLE `equipamentotxt`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `escritorio_contabils`
--
ALTER TABLE `escritorio_contabils`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `estoques`
--
ALTER TABLE `estoques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estoques_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `fatura_orcamentos`
--
ALTER TABLE `fatura_orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fatura_orcamentos_orcamento_id_foreign` (`orcamento_id`);

--
-- Índices para tabela `fornecedors`
--
ALTER TABLE `fornecedors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fornecedors_cidade_id_foreign` (`cidade_id`);

--
-- Índices para tabela `fretes`
--
ALTER TABLE `fretes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcionamento_deliveries`
--
ALTER TABLE `funcionamento_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionarios_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `funcionario_os`
--
ALTER TABLE `funcionario_os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionario_os_usuario_id_foreign` (`usuario_id`),
  ADD KEY `funcionario_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  ADD KEY `funcionario_os_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices para tabela `imagem_produto_ecommerces`
--
ALTER TABLE `imagem_produto_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagem_produto_ecommerces_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `imagens_produto_deliveries`
--
ALTER TABLE `imagens_produto_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagens_produto_deliveries_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `informativo_ecommerces`
--
ALTER TABLE `informativo_ecommerces`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `info_descargas`
--
ALTER TABLE `info_descargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `info_descargas_mdfe_id_foreign` (`mdfe_id`),
  ADD KEY `info_descargas_cidade_id_foreign` (`cidade_id`);

--
-- Índices para tabela `item_agendamentos`
--
ALTER TABLE `item_agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_agendamentos_servico_id_foreign` (`servico_id`),
  ADD KEY `item_agendamentos_agendamento_id_foreign` (`agendamento_id`);

--
-- Índices para tabela `item_compras`
--
ALTER TABLE `item_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_compras_compra_id_foreign` (`compra_id`),
  ADD KEY `item_compras_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `item_cotacaos`
--
ALTER TABLE `item_cotacaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_cotacaos_cotacao_id_foreign` (`cotacao_id`),
  ADD KEY `item_cotacaos_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `item_devolucaos`
--
ALTER TABLE `item_devolucaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_devolucaos_devolucao_id_foreign` (`devolucao_id`);

--
-- Índices para tabela `item_dves`
--
ALTER TABLE `item_dves`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `item_i_b_t_e_s`
--
ALTER TABLE `item_i_b_t_e_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_i_b_t_e_s_ibte_id_foreign` (`ibte_id`);

--
-- Índices para tabela `item_orcamentos`
--
ALTER TABLE `item_orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_orcamentos_orcamento_id_foreign` (`orcamento_id`),
  ADD KEY `item_orcamentos_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `item_pack_produto_deliveries`
--
ALTER TABLE `item_pack_produto_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pack_produto_deliveries_produto_delivery_id_foreign` (`produto_delivery_id`),
  ADD KEY `item_pack_produto_deliveries_pack_id_foreign` (`pack_id`);

--
-- Índices para tabela `item_pedidos`
--
ALTER TABLE `item_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedidos_produto_id_foreign` (`produto_id`),
  ADD KEY `item_pedidos_pedido_id_foreign` (`pedido_id`),
  ADD KEY `item_pedidos_tamanho_pizza_id_foreign` (`tamanho_pizza_id`),
  ADD KEY `item_pedidos_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `item_pedido_complemento_deliveries`
--
ALTER TABLE `item_pedido_complemento_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedido_complemento_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
  ADD KEY `item_pedido_complemento_deliveries_complemento_id_foreign` (`complemento_id`);

--
-- Índices para tabela `item_pedido_complemento_locals`
--
ALTER TABLE `item_pedido_complemento_locals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedido_complemento_locals_item_pedido_foreign` (`item_pedido`),
  ADD KEY `item_pedido_complemento_locals_complemento_id_foreign` (`complemento_id`);

--
-- Índices para tabela `item_pedido_deliveries`
--
ALTER TABLE `item_pedido_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedido_deliveries_produto_id_foreign` (`produto_id`),
  ADD KEY `item_pedido_deliveries_pedido_id_foreign` (`pedido_id`),
  ADD KEY `item_pedido_deliveries_tamanho_id_foreign` (`tamanho_id`);

--
-- Índices para tabela `item_pedido_ecommerces`
--
ALTER TABLE `item_pedido_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedido_ecommerces_pedido_id_foreign` (`pedido_id`),
  ADD KEY `item_pedido_ecommerces_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `item_pizza_pedidos`
--
ALTER TABLE `item_pizza_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pizza_pedidos_item_pedido_foreign` (`item_pedido`),
  ADD KEY `item_pizza_pedidos_sabor_id_foreign` (`sabor_id`);

--
-- Índices para tabela `item_pizza_pedido_locals`
--
ALTER TABLE `item_pizza_pedido_locals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pizza_pedido_locals_item_pedido_foreign` (`item_pedido`),
  ADD KEY `item_pizza_pedido_locals_sabor_id_foreign` (`sabor_id`);

--
-- Índices para tabela `item_receitas`
--
ALTER TABLE `item_receitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_receitas_produto_id_foreign` (`produto_id`),
  ADD KEY `item_receitas_receita_id_foreign` (`receita_id`);

--
-- Índices para tabela `item_vendas`
--
ALTER TABLE `item_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_vendas_venda_id_foreign` (`venda_id`),
  ADD KEY `item_vendas_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `item_venda_caixas`
--
ALTER TABLE `item_venda_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_venda_caixas_venda_caixa_id_foreign` (`venda_caixa_id`),
  ADD KEY `item_venda_caixas_produto_id_foreign` (`produto_id`),
  ADD KEY `item_venda_caixas_item_pedido_id_foreign` (`item_pedido_id`);

--
-- Índices para tabela `i_b_p_t_s`
--
ALTER TABLE `i_b_p_t_s`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `lacre_transportes`
--
ALTER TABLE `lacre_transportes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lacre_transportes_info_id_foreign` (`info_id`);

--
-- Índices para tabela `lacre_unidade_cargas`
--
ALTER TABLE `lacre_unidade_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lacre_unidade_cargas_info_id_foreign` (`info_id`);

--
-- Índices para tabela `lancamento_categorias`
--
ALTER TABLE `lancamento_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lancamento_categorias_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `lista_complemento_deliveries`
--
ALTER TABLE `lista_complemento_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lista_complemento_deliveries_produto_id_foreign` (`produto_id`),
  ADD KEY `lista_complemento_deliveries_complemento_id_foreign` (`complemento_id`);

--
-- Índices para tabela `lista_precos`
--
ALTER TABLE `lista_precos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `manifesta_dves`
--
ALTER TABLE `manifesta_dves`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mdves`
--
ALTER TABLE `mdves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdves_veiculo_tracao_id_foreign` (`veiculo_tracao_id`),
  ADD KEY `mdves_veiculo_reboque_id_foreign` (`veiculo_reboque_id`);

--
-- Índices para tabela `medida_ctes`
--
ALTER TABLE `medida_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medida_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices para tabela `mercado_configs`
--
ALTER TABLE `mercado_configs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `motoboys`
--
ALTER TABLE `motoboys`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `municipio_carregamentos`
--
ALTER TABLE `municipio_carregamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipio_carregamentos_mdfe_id_foreign` (`mdfe_id`),
  ADD KEY `municipio_carregamentos_cidade_id_foreign` (`cidade_id`);

--
-- Índices para tabela `natureza_operacaos`
--
ALTER TABLE `natureza_operacaos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `n_fe_descargas`
--
ALTER TABLE `n_fe_descargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `n_fe_descargas_info_id_foreign` (`info_id`);

--
-- Índices para tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orcamentos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `orcamentos_usuario_id_foreign` (`usuario_id`),
  ADD KEY `orcamentos_natureza_id_foreign` (`natureza_id`),
  ADD KEY `orcamentos_frete_id_foreign` (`frete_id`),
  ADD KEY `orcamentos_transportadora_id_foreign` (`transportadora_id`);

--
-- Índices para tabela `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordem_servicos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `ordem_servicos_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `pack_produto_deliveries`
--
ALTER TABLE `pack_produto_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_mesa_id_foreign` (`mesa_id`),
  ADD KEY `pedidos_bairro_id_foreign` (`bairro_id`);

--
-- Índices para tabela `pedido_deletes`
--
ALTER TABLE `pedido_deletes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedido_deliveries`
--
ALTER TABLE `pedido_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_deliveries_cliente_id_foreign` (`cliente_id`),
  ADD KEY `pedido_deliveries_endereco_id_foreign` (`endereco_id`),
  ADD KEY `pedido_deliveries_cupom_id_foreign` (`cupom_id`);

--
-- Índices para tabela `pedido_ecommerces`
--
ALTER TABLE `pedido_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_ecommerces_cliente_id_foreign` (`cliente_id`),
  ADD KEY `pedido_ecommerces_endereco_id_foreign` (`endereco_id`);

--
-- Índices para tabela `pedido_motoboys`
--
ALTER TABLE `pedido_motoboys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_motoboys_motoboy_id_foreign` (`motoboy_id`),
  ADD KEY `pedido_motoboys_pedido_id_foreign` (`pedido_id`);

--
-- Índices para tabela `pedido_pag_seguros`
--
ALTER TABLE `pedido_pag_seguros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_pag_seguros_pedido_delivery_id_foreign` (`pedido_delivery_id`);

--
-- Índices para tabela `pedido_qr_code_clientes`
--
ALTER TABLE `pedido_qr_code_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_qr_code_clientes_pedido_id_foreign` (`pedido_id`);

--
-- Índices para tabela `percursos`
--
ALTER TABLE `percursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `percursos_mdfe_id_foreign` (`mdfe_id`);

--
-- Índices para tabela `post_blog_ecommerces`
--
ALTER TABLE `post_blog_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_blog_ecommerces_categoria_id_foreign` (`categoria_id`),
  ADD KEY `post_blog_ecommerces_autor_id_foreign` (`autor_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtos_categoria_id_foreign` (`categoria_id`),
  ADD KEY `produtos_tela_id_foreign` (`tela_id`);

--
-- Índices para tabela `produto_deliveries`
--
ALTER TABLE `produto_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_deliveries_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_deliveries_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `produto_ecommerces`
--
ALTER TABLE `produto_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_ecommerces_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_ecommerces_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `produto_favorito_deliveries`
--
ALTER TABLE `produto_favorito_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_favorito_deliveries_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_favorito_deliveries_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `produto_lista_precos`
--
ALTER TABLE `produto_lista_precos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_lista_precos_lista_id_foreign` (`lista_id`),
  ADD KEY `produto_lista_precos_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `produto_pizzas`
--
ALTER TABLE `produto_pizzas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_pizzas_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_pizzas_tamanho_id_foreign` (`tamanho_id`);

--
-- Índices para tabela `pushes`
--
ALTER TABLE `pushes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pushes_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receitas_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `receita_ctes`
--
ALTER TABLE `receita_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receita_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices para tabela `relatorio_os`
--
ALTER TABLE `relatorio_os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relatorio_os_usuario_id_foreign` (`usuario_id`),
  ADD KEY `relatorio_os_ordem_servico_id_foreign` (`ordem_servico_id`);

--
-- Índices para tabela `sangria_caixas`
--
ALTER TABLE `sangria_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sangria_caixas_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicos_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `servico_os`
--
ALTER TABLE `servico_os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servico_os_servico_id_foreign` (`servico_id`),
  ADD KEY `servico_os_ordem_servico_id_foreign` (`ordem_servico_id`);

--
-- Índices para tabela `suprimento_caixas`
--
ALTER TABLE `suprimento_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suprimento_caixas_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `tamanho_pizzas`
--
ALTER TABLE `tamanho_pizzas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tela_pedidos`
--
ALTER TABLE `tela_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `token_cliente_deliveries`
--
ALTER TABLE `token_cliente_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token_cliente_deliveries_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `token_webs`
--
ALTER TABLE `token_webs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token_webs_cliente_id_foreign` (`cliente_id`);

--
-- Índices para tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transportadoras_cidade_id_foreign` (`cidade_id`);

--
-- Índices para tabela `tributacaos`
--
ALTER TABLE `tributacaos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `unidade_cargas`
--
ALTER TABLE `unidade_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unidade_cargas_info_id_foreign` (`info_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vale_pedagios`
--
ALTER TABLE `vale_pedagios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vale_pedagios_mdfe_id_foreign` (`mdfe_id`);

--
-- Índices para tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `vendas_usuario_id_foreign` (`usuario_id`),
  ADD KEY `vendas_natureza_id_foreign` (`natureza_id`),
  ADD KEY `vendas_frete_id_foreign` (`frete_id`),
  ADD KEY `vendas_transportadora_id_foreign` (`transportadora_id`);

--
-- Índices para tabela `venda_caixas`
--
ALTER TABLE `venda_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venda_caixas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `venda_caixas_usuario_id_foreign` (`usuario_id`),
  ADD KEY `venda_caixas_natureza_id_foreign` (`natureza_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `abertura_caixas`
--
ALTER TABLE `abertura_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `alteracao_estoques`
--
ALTER TABLE `alteracao_estoques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `apontamentos`
--
ALTER TABLE `apontamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `autor_post_blog_ecommerces`
--
ALTER TABLE `autor_post_blog_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bairro_deliveries`
--
ALTER TABLE `bairro_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `banner_mais_vendidos`
--
ALTER TABLE `banner_mais_vendidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `banner_topos`
--
ALTER TABLE `banner_topos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carrossel_ecommerces`
--
ALTER TABLE `carrossel_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `categoria_adicionals`
--
ALTER TABLE `categoria_adicionals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_contas`
--
ALTER TABLE `categoria_contas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `categoria_despesa_ctes`
--
ALTER TABLE `categoria_despesa_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_post_blog_ecommerces`
--
ALTER TABLE `categoria_post_blog_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_produto_deliveries`
--
ALTER TABLE `categoria_produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_produto_ecommerces`
--
ALTER TABLE `categoria_produto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_servicos`
--
ALTER TABLE `categoria_servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5571;

--
-- AUTO_INCREMENT de tabela `ciots`
--
ALTER TABLE `ciots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cliente_deliveries`
--
ALTER TABLE `cliente_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente_ecommerces`
--
ALTER TABLE `cliente_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `codigo_descontos`
--
ALTER TABLE `codigo_descontos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comissao_vendas`
--
ALTER TABLE `comissao_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `complemento_deliveries`
--
ALTER TABLE `complemento_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `componente_ctes`
--
ALTER TABLE `componente_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `config_caixas`
--
ALTER TABLE `config_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `config_ecommerces`
--
ALTER TABLE `config_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `config_notas`
--
ALTER TABLE `config_notas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `contato_ecommerces`
--
ALTER TABLE `contato_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contato_funcionarios`
--
ALTER TABLE `contato_funcionarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta_pagars`
--
ALTER TABLE `conta_pagars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `conta_recebers`
--
ALTER TABLE `conta_recebers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cotacaos`
--
ALTER TABLE `cotacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `credito_vendas`
--
ALTER TABLE `credito_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ctes`
--
ALTER TABLE `ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `curtida_produto_ecommerces`
--
ALTER TABLE `curtida_produto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `c_te_descargas`
--
ALTER TABLE `c_te_descargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `delivery_configs`
--
ALTER TABLE `delivery_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `despesa_ctes`
--
ALTER TABLE `despesa_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `devolucaos`
--
ALTER TABLE `devolucaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `divisao_grades`
--
ALTER TABLE `divisao_grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dres`
--
ALTER TABLE `dres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dre_categorias`
--
ALTER TABLE `dre_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco_deliveries`
--
ALTER TABLE `endereco_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco_ecommerces`
--
ALTER TABLE `endereco_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipamentotxt`
--
ALTER TABLE `equipamentotxt`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `escritorio_contabils`
--
ALTER TABLE `escritorio_contabils`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoques`
--
ALTER TABLE `estoques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `fatura_orcamentos`
--
ALTER TABLE `fatura_orcamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedors`
--
ALTER TABLE `fornecedors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fretes`
--
ALTER TABLE `fretes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `funcionamento_deliveries`
--
ALTER TABLE `funcionamento_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `funcionario_os`
--
ALTER TABLE `funcionario_os`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagem_produto_ecommerces`
--
ALTER TABLE `imagem_produto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagens_produto_deliveries`
--
ALTER TABLE `imagens_produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `informativo_ecommerces`
--
ALTER TABLE `informativo_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `info_descargas`
--
ALTER TABLE `info_descargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_agendamentos`
--
ALTER TABLE `item_agendamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_compras`
--
ALTER TABLE `item_compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `item_cotacaos`
--
ALTER TABLE `item_cotacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_devolucaos`
--
ALTER TABLE `item_devolucaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_dves`
--
ALTER TABLE `item_dves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_i_b_t_e_s`
--
ALTER TABLE `item_i_b_t_e_s`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_orcamentos`
--
ALTER TABLE `item_orcamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pack_produto_deliveries`
--
ALTER TABLE `item_pack_produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedidos`
--
ALTER TABLE `item_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido_complemento_deliveries`
--
ALTER TABLE `item_pedido_complemento_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido_complemento_locals`
--
ALTER TABLE `item_pedido_complemento_locals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido_deliveries`
--
ALTER TABLE `item_pedido_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido_ecommerces`
--
ALTER TABLE `item_pedido_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pizza_pedidos`
--
ALTER TABLE `item_pizza_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pizza_pedido_locals`
--
ALTER TABLE `item_pizza_pedido_locals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_receitas`
--
ALTER TABLE `item_receitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_vendas`
--
ALTER TABLE `item_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `item_venda_caixas`
--
ALTER TABLE `item_venda_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `i_b_p_t_s`
--
ALTER TABLE `i_b_p_t_s`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lacre_transportes`
--
ALTER TABLE `lacre_transportes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lacre_unidade_cargas`
--
ALTER TABLE `lacre_unidade_cargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lancamento_categorias`
--
ALTER TABLE `lancamento_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lista_complemento_deliveries`
--
ALTER TABLE `lista_complemento_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lista_precos`
--
ALTER TABLE `lista_precos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `manifesta_dves`
--
ALTER TABLE `manifesta_dves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mdves`
--
ALTER TABLE `mdves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `medida_ctes`
--
ALTER TABLE `medida_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mercado_configs`
--
ALTER TABLE `mercado_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1864;

--
-- AUTO_INCREMENT de tabela `motoboys`
--
ALTER TABLE `motoboys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `municipio_carregamentos`
--
ALTER TABLE `municipio_carregamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `natureza_operacaos`
--
ALTER TABLE `natureza_operacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `n_fe_descargas`
--
ALTER TABLE `n_fe_descargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pack_produto_deliveries`
--
ALTER TABLE `pack_produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_deletes`
--
ALTER TABLE `pedido_deletes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_deliveries`
--
ALTER TABLE `pedido_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_ecommerces`
--
ALTER TABLE `pedido_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_motoboys`
--
ALTER TABLE `pedido_motoboys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_pag_seguros`
--
ALTER TABLE `pedido_pag_seguros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_qr_code_clientes`
--
ALTER TABLE `pedido_qr_code_clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `percursos`
--
ALTER TABLE `percursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post_blog_ecommerces`
--
ALTER TABLE `post_blog_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `produto_deliveries`
--
ALTER TABLE `produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_ecommerces`
--
ALTER TABLE `produto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_favorito_deliveries`
--
ALTER TABLE `produto_favorito_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_lista_precos`
--
ALTER TABLE `produto_lista_precos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_pizzas`
--
ALTER TABLE `produto_pizzas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pushes`
--
ALTER TABLE `pushes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `receita_ctes`
--
ALTER TABLE `receita_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relatorio_os`
--
ALTER TABLE `relatorio_os`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `sangria_caixas`
--
ALTER TABLE `sangria_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `servico_os`
--
ALTER TABLE `servico_os`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `suprimento_caixas`
--
ALTER TABLE `suprimento_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tamanho_pizzas`
--
ALTER TABLE `tamanho_pizzas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tela_pedidos`
--
ALTER TABLE `tela_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `token_cliente_deliveries`
--
ALTER TABLE `token_cliente_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `token_webs`
--
ALTER TABLE `token_webs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tributacaos`
--
ALTER TABLE `tributacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `unidade_cargas`
--
ALTER TABLE `unidade_cargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `vale_pedagios`
--
ALTER TABLE `vale_pedagios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `venda_caixas`
--
ALTER TABLE `venda_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `abertura_caixas`
--
ALTER TABLE `abertura_caixas`
  ADD CONSTRAINT `abertura_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `agendamentos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

--
-- Limitadores para a tabela `alteracao_estoques`
--
ALTER TABLE `alteracao_estoques`
  ADD CONSTRAINT `alteracao_estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alteracao_estoques_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `apontamentos`
--
ALTER TABLE `apontamentos`
  ADD CONSTRAINT `apontamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `apontamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `banner_mais_vendidos`
--
ALTER TABLE `banner_mais_vendidos`
  ADD CONSTRAINT `banner_mais_vendidos_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_mais_vendidos_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `banner_topos`
--
ALTER TABLE `banner_topos`
  ADD CONSTRAINT `banner_topos_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_topos_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ciots`
--
ALTER TABLE `ciots`
  ADD CONSTRAINT `ciots_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_cidade_cobranca_id_foreign` FOREIGN KEY (`cidade_cobranca_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clientes_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `codigo_descontos`
--
ALTER TABLE `codigo_descontos`
  ADD CONSTRAINT `codigo_descontos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `comissao_vendas`
--
ALTER TABLE `comissao_vendas`
  ADD CONSTRAINT `comissao_vendas_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `complemento_deliveries`
--
ALTER TABLE `complemento_deliveries`
  ADD CONSTRAINT `complemento_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_adicionals` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `componente_ctes`
--
ALTER TABLE `componente_ctes`
  ADD CONSTRAINT `componente_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `config_caixas`
--
ALTER TABLE `config_caixas`
  ADD CONSTRAINT `config_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `contato_funcionarios`
--
ALTER TABLE `contato_funcionarios`
  ADD CONSTRAINT `contato_funcionarios_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

--
-- Limitadores para a tabela `conta_pagars`
--
ALTER TABLE `conta_pagars`
  ADD CONSTRAINT `conta_pagars_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_contas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_pagars_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `conta_recebers`
--
ALTER TABLE `conta_recebers`
  ADD CONSTRAINT `conta_recebers_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_contas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_recebers_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_recebers_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `cotacaos`
--
ALTER TABLE `cotacaos`
  ADD CONSTRAINT `cotacaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`);

--
-- Limitadores para a tabela `credito_vendas`
--
ALTER TABLE `credito_vendas`
  ADD CONSTRAINT `credito_vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `credito_vendas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ctes`
--
ALTER TABLE `ctes`
  ADD CONSTRAINT `ctes_destinatario_id_foreign` FOREIGN KEY (`destinatario_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ctes_municipio_envio_foreign` FOREIGN KEY (`municipio_envio`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `ctes_municipio_fim_foreign` FOREIGN KEY (`municipio_fim`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `ctes_municipio_inicio_foreign` FOREIGN KEY (`municipio_inicio`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `ctes_municipio_tomador_foreign` FOREIGN KEY (`municipio_tomador`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `ctes_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `ctes_remetente_id_foreign` FOREIGN KEY (`remetente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ctes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ctes_veiculo_id_foreign` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`);

--
-- Limitadores para a tabela `curtida_produto_ecommerces`
--
ALTER TABLE `curtida_produto_ecommerces`
  ADD CONSTRAINT `curtida_produto_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `curtida_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `c_te_descargas`
--
ALTER TABLE `c_te_descargas`
  ADD CONSTRAINT `c_te_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `despesa_ctes`
--
ALTER TABLE `despesa_ctes`
  ADD CONSTRAINT `despesa_ctes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_despesa_ctes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `despesa_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `devolucaos`
--
ALTER TABLE `devolucaos`
  ADD CONSTRAINT `devolucaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
  ADD CONSTRAINT `devolucaos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `devolucaos_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`),
  ADD CONSTRAINT `devolucaos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `dre_categorias`
--
ALTER TABLE `dre_categorias`
  ADD CONSTRAINT `dre_categorias_dre_id_foreign` FOREIGN KEY (`dre_id`) REFERENCES `dres` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `endereco_deliveries`
--
ALTER TABLE `endereco_deliveries`
  ADD CONSTRAINT `endereco_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `endereco_ecommerces`
--
ALTER TABLE `endereco_ecommerces`
  ADD CONSTRAINT `endereco_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `estoques`
--
ALTER TABLE `estoques`
  ADD CONSTRAINT `estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `fatura_orcamentos`
--
ALTER TABLE `fatura_orcamentos`
  ADD CONSTRAINT `fatura_orcamentos_orcamento_id_foreign` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `fornecedors`
--
ALTER TABLE `fornecedors`
  ADD CONSTRAINT `fornecedors_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `funcionario_os`
--
ALTER TABLE `funcionario_os`
  ADD CONSTRAINT `funcionario_os_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `funcionario_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  ADD CONSTRAINT `funcionario_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `imagem_produto_ecommerces`
--
ALTER TABLE `imagem_produto_ecommerces`
  ADD CONSTRAINT `imagem_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `imagens_produto_deliveries`
--
ALTER TABLE `imagens_produto_deliveries`
  ADD CONSTRAINT `imagens_produto_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `info_descargas`
--
ALTER TABLE `info_descargas`
  ADD CONSTRAINT `info_descargas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `info_descargas_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_agendamentos`
--
ALTER TABLE `item_agendamentos`
  ADD CONSTRAINT `item_agendamentos_agendamento_id_foreign` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamentos` (`id`),
  ADD CONSTRAINT `item_agendamentos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`);

--
-- Limitadores para a tabela `item_compras`
--
ALTER TABLE `item_compras`
  ADD CONSTRAINT `item_compras_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `item_compras_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Limitadores para a tabela `item_cotacaos`
--
ALTER TABLE `item_cotacaos`
  ADD CONSTRAINT `item_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_cotacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Limitadores para a tabela `item_devolucaos`
--
ALTER TABLE `item_devolucaos`
  ADD CONSTRAINT `item_devolucaos_devolucao_id_foreign` FOREIGN KEY (`devolucao_id`) REFERENCES `devolucaos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_i_b_t_e_s`
--
ALTER TABLE `item_i_b_t_e_s`
  ADD CONSTRAINT `item_i_b_t_e_s_ibte_id_foreign` FOREIGN KEY (`ibte_id`) REFERENCES `i_b_p_t_s` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_orcamentos`
--
ALTER TABLE `item_orcamentos`
  ADD CONSTRAINT `item_orcamentos_orcamento_id_foreign` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_orcamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Limitadores para a tabela `item_pack_produto_deliveries`
--
ALTER TABLE `item_pack_produto_deliveries`
  ADD CONSTRAINT `item_pack_produto_deliveries_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pack_produto_deliveries_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_pedidos`
--
ALTER TABLE `item_pedidos`
  ADD CONSTRAINT `item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `item_pedidos_tamanho_pizza_id_foreign` FOREIGN KEY (`tamanho_pizza_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedidos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `item_pedido_complemento_deliveries`
--
ALTER TABLE `item_pedido_complemento_deliveries`
  ADD CONSTRAINT `item_pedido_complemento_deliveries_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_complemento_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_pedido_complemento_locals`
--
ALTER TABLE `item_pedido_complemento_locals`
  ADD CONSTRAINT `item_pedido_complemento_locals_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_complemento_locals_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_pedido_deliveries`
--
ALTER TABLE `item_pedido_deliveries`
  ADD CONSTRAINT `item_pedido_deliveries_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_pedido_ecommerces`
--
ALTER TABLE `item_pedido_ecommerces`
  ADD CONSTRAINT `item_pedido_ecommerces_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_pizza_pedidos`
--
ALTER TABLE `item_pizza_pedidos`
  ADD CONSTRAINT `item_pizza_pedidos_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedido_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pizza_pedidos_sabor_id_foreign` FOREIGN KEY (`sabor_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_pizza_pedido_locals`
--
ALTER TABLE `item_pizza_pedido_locals`
  ADD CONSTRAINT `item_pizza_pedido_locals_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pizza_pedido_locals_sabor_id_foreign` FOREIGN KEY (`sabor_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_receitas`
--
ALTER TABLE `item_receitas`
  ADD CONSTRAINT `item_receitas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_receitas_receita_id_foreign` FOREIGN KEY (`receita_id`) REFERENCES `receitas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_vendas`
--
ALTER TABLE `item_vendas`
  ADD CONSTRAINT `item_vendas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `item_vendas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `item_venda_caixas`
--
ALTER TABLE `item_venda_caixas`
  ADD CONSTRAINT `item_venda_caixas_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_venda_caixas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `item_venda_caixas_venda_caixa_id_foreign` FOREIGN KEY (`venda_caixa_id`) REFERENCES `venda_caixas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `lacre_transportes`
--
ALTER TABLE `lacre_transportes`
  ADD CONSTRAINT `lacre_transportes_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `lacre_unidade_cargas`
--
ALTER TABLE `lacre_unidade_cargas`
  ADD CONSTRAINT `lacre_unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `lancamento_categorias`
--
ALTER TABLE `lancamento_categorias`
  ADD CONSTRAINT `lancamento_categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `dre_categorias` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `lista_complemento_deliveries`
--
ALTER TABLE `lista_complemento_deliveries`
  ADD CONSTRAINT `lista_complemento_deliveries_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lista_complemento_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `mdves`
--
ALTER TABLE `mdves`
  ADD CONSTRAINT `mdves_veiculo_reboque_id_foreign` FOREIGN KEY (`veiculo_reboque_id`) REFERENCES `veiculos` (`id`),
  ADD CONSTRAINT `mdves_veiculo_tracao_id_foreign` FOREIGN KEY (`veiculo_tracao_id`) REFERENCES `veiculos` (`id`);

--
-- Limitadores para a tabela `medida_ctes`
--
ALTER TABLE `medida_ctes`
  ADD CONSTRAINT `medida_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `municipio_carregamentos`
--
ALTER TABLE `municipio_carregamentos`
  ADD CONSTRAINT `municipio_carregamentos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `municipio_carregamentos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `n_fe_descargas`
--
ALTER TABLE `n_fe_descargas`
  ADD CONSTRAINT `n_fe_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD CONSTRAINT `orcamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `orcamentos_frete_id_foreign` FOREIGN KEY (`frete_id`) REFERENCES `fretes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orcamentos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `orcamentos_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orcamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  ADD CONSTRAINT `ordem_servicos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordem_servicos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_bairro_id_foreign` FOREIGN KEY (`bairro_id`) REFERENCES `bairro_deliveries` (`id`),
  ADD CONSTRAINT `pedidos_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`);

--
-- Limitadores para a tabela `pedido_deliveries`
--
ALTER TABLE `pedido_deliveries`
  ADD CONSTRAINT `pedido_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_deliveries_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `codigo_descontos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_deliveries_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedido_ecommerces`
--
ALTER TABLE `pedido_ecommerces`
  ADD CONSTRAINT `pedido_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_ecommerces_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedido_motoboys`
--
ALTER TABLE `pedido_motoboys`
  ADD CONSTRAINT `pedido_motoboys_motoboy_id_foreign` FOREIGN KEY (`motoboy_id`) REFERENCES `motoboys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_motoboys_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedido_pag_seguros`
--
ALTER TABLE `pedido_pag_seguros`
  ADD CONSTRAINT `pedido_pag_seguros_pedido_delivery_id_foreign` FOREIGN KEY (`pedido_delivery_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedido_qr_code_clientes`
--
ALTER TABLE `pedido_qr_code_clientes`
  ADD CONSTRAINT `pedido_qr_code_clientes_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `percursos`
--
ALTER TABLE `percursos`
  ADD CONSTRAINT `percursos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `post_blog_ecommerces`
--
ALTER TABLE `post_blog_ecommerces`
  ADD CONSTRAINT `post_blog_ecommerces_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `autor_post_blog_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_blog_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_post_blog_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produtos_tela_id_foreign` FOREIGN KEY (`tela_id`) REFERENCES `tela_pedidos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produto_deliveries`
--
ALTER TABLE `produto_deliveries`
  ADD CONSTRAINT `produto_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produto_ecommerces`
--
ALTER TABLE `produto_ecommerces`
  ADD CONSTRAINT `produto_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produto_favorito_deliveries`
--
ALTER TABLE `produto_favorito_deliveries`
  ADD CONSTRAINT `produto_favorito_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_favorito_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produto_lista_precos`
--
ALTER TABLE `produto_lista_precos`
  ADD CONSTRAINT `produto_lista_precos_lista_id_foreign` FOREIGN KEY (`lista_id`) REFERENCES `lista_precos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_lista_precos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produto_pizzas`
--
ALTER TABLE `produto_pizzas`
  ADD CONSTRAINT `produto_pizzas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_pizzas_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pushes`
--
ALTER TABLE `pushes`
  ADD CONSTRAINT `pushes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `receitas`
--
ALTER TABLE `receitas`
  ADD CONSTRAINT `receitas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `receita_ctes`
--
ALTER TABLE `receita_ctes`
  ADD CONSTRAINT `receita_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `relatorio_os`
--
ALTER TABLE `relatorio_os`
  ADD CONSTRAINT `relatorio_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  ADD CONSTRAINT `relatorio_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `sangria_caixas`
--
ALTER TABLE `sangria_caixas`
  ADD CONSTRAINT `sangria_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `servicos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_servicos` (`id`);

--
-- Limitadores para a tabela `servico_os`
--
ALTER TABLE `servico_os`
  ADD CONSTRAINT `servico_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  ADD CONSTRAINT `servico_os_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`);

--
-- Limitadores para a tabela `suprimento_caixas`
--
ALTER TABLE `suprimento_caixas`
  ADD CONSTRAINT `suprimento_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `token_cliente_deliveries`
--
ALTER TABLE `token_cliente_deliveries`
  ADD CONSTRAINT `token_cliente_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `token_webs`
--
ALTER TABLE `token_webs`
  ADD CONSTRAINT `token_webs_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD CONSTRAINT `transportadoras_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `unidade_cargas`
--
ALTER TABLE `unidade_cargas`
  ADD CONSTRAINT `unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `vale_pedagios`
--
ALTER TABLE `vale_pedagios`
  ADD CONSTRAINT `vale_pedagios_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `vendas_frete_id_foreign` FOREIGN KEY (`frete_id`) REFERENCES `fretes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `vendas_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `venda_caixas`
--
ALTER TABLE `venda_caixas`
  ADD CONSTRAINT `venda_caixas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `venda_caixas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `venda_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
