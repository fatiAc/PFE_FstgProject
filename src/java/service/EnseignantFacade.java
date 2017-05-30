/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Departement;
import bean.Enseignant;
import controller.util.SearchUtil;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author HP
 */
@Stateless
public class EnseignantFacade extends AbstractFacade<Enseignant> {

    @PersistenceContext(unitName = "Pfe_FstgProjectPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EnseignantFacade() {
        super(Enseignant.class);
    }

    public List<Enseignant> findByDepartm(Departement d) {
        String requette = "SELECT ens FROM Enseignant ens WHERE 1=1";
        if (d.getId() != null && d != null) {
            requette +=SearchUtil.addConstraint("ens.departement", "id", "=", d.getId());
            requette+=" ORDER BY ens.nom";
        }
        return em.createQuery(requette).getResultList();
    }

}
