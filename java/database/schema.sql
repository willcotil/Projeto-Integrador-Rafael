CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `conteudo` text NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `data_comentario` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_comentario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comunidades` (
  `id_comunidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_comunidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `estatisticas_usuario` (
  `id_estatistica` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `tempo_total_uso` int(11) DEFAULT '0',
  `posts_visualizados` int(11) DEFAULT '0',
  `posts_criados` int(11) DEFAULT '0',
  `comentarios_feitos` int(11) DEFAULT '0',
  `votos_realizados` int(11) DEFAULT '0',
  `ultimo_acesso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estatistica`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `estatisticas_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `imagens_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `imagens_post_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `interacoes_usuario` (
  `id_interacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `tipo_interacao` enum('visualizacao','like','dislike','comentario','compartilhamento') DEFAULT NULL,
  `data_interacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_interacao`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `interacoes_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `interacoes_usuario_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `membros_comunidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_comunidade` int(11) DEFAULT NULL,
  `data_entrada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_comunidade` (`id_comunidade`),
  CONSTRAINT `membros_comunidade_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `membros_comunidade_ibfk_2` FOREIGN KEY (`id_comunidade`) REFERENCES `comunidades` (`id_comunidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `posts` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `conteudo` text,
  `id_usuario` int(11) DEFAULT NULL,
  `id_comunidade` int(11) DEFAULT NULL,
  `data_postagem` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_post`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_comunidade` (`id_comunidade`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`id_comunidade`) REFERENCES `comunidades` (`id_comunidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `posts_salvos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `posts_salvos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `posts_salvos_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `votos` (
  `id_voto` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('like','dislike') DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_voto`),
  UNIQUE KEY `id_usuario` (`id_usuario`,`id_post`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
