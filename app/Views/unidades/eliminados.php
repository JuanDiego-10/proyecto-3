<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h4 class="mt-4"><?php echo $titulo; ?></h4>
                        <div>
                            <p>
                                <a href="<?php echo base_url();?>/unidades" 
                                class="btn btn-warning">Unidades</a>
                            </p>
                        </div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Nombre corto</th>
                                            <th></th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach($datos as $dato) { ?>
                                            <tr>
                                                <td><?php echo $dato['id']; ?></td>
                                                <td><?php echo $dato['nombre']; ?></td>
                                                <td><?php echo $dato['nombre_corto']; ?></td>

                                                <td><a href="<?php echo base_url(). '/unidades/reingresar/'.$dato['id']; ?>" 
                                                class="btn btn-warning"><i class="fa-solid fa-flag"></i></a></td>

                                     <!-- MODAL DE AVISO          <td><a href="#" data-href="<?php echo base_url(). '/unidades/reingresar/'.$dato['id']; ?>" 
                                               data-toggle="modal" data-target="#modal-hola" data-placement="top" tittle="Reingresar registro" class="btn btn-danger">
                                               <i class="fa-solid fa-flag"></i></a></td> 
-->
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                            <!--</div>-->
                </main>
                
                 <!-- Modal -->

<div class="modal fade" id="modal-hola" tabindex="-1" role="dialog"
 aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Reingresar registro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <p>¿Desea reingresar este registro?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">NO</button>
        <a  class="btn btn-danger btn-ok">Si</a>
      </div>
    </div>
  </div>
</div>