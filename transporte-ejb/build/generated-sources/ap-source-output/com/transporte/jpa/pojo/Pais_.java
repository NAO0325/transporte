package com.transporte.jpa.pojo;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Pais.class)
public abstract class Pais_ {

	public static volatile CollectionAttribute<Pais, Persona> personaCollection;
	public static volatile CollectionAttribute<Pais, Departamento> departamentoCollection;
	public static volatile SingularAttribute<Pais, Integer> idpais;
	public static volatile SingularAttribute<Pais, String> nombre;

}

