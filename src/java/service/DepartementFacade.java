/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Departement;
import controller.util.ServerConfig;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.primefaces.event.FileUploadEvent;

/**
 *
 * @author HP
 */
@Stateless
public class DepartementFacade extends AbstractFacade<Departement> {

    @PersistenceContext(unitName = "Pfe_FstgProjectPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DepartementFacade() {
        super(Departement.class);
    }
    
    public List<Departement> findAllDeprtm(){
        return em.createQuery("SELECT d FROM Departement d WHERE 1=1 ORDER BY d.intitule").getResultList();
    }
    
    public void update(Departement d, FileUploadEvent fileUploadEvent) {
        System.out.println("FIle name uploaded :::::: "+fileUploadEvent.getFile().getFileName()); 
        //System.out.println("logo avant create(commune); " + d.getSignature());
        edit(d);
       // System.out.println("logo avant create(commune); " + d.getSignature());
        ServerConfig.createDepartmFiles(d);
        FileUploadEvent event = fileUploadEvent;
        //SessionUtil.getCurrentCommune().setSignature(commune.getSignature());
      //  String chemin = CreateFileUtil.getPath("resources")+"\\signatures\\commune_"+SessionUtil.getCurrentCommune().getNom()+"_"+SessionUtil.getCurrentCommune().getId();
       // ServerConfig.upload(event.getFile(), chemin, d.getImg());
}
}
