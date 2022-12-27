<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <h4 class="mt-4"><?php echo $titulo?></h4>

            <?php if(isset($validation)){ ?>
                <div class="alert alert-danger" >
            <?php echo $validation->listErrors(); ?>
                </div>
            <?php }?>

            <form method="POST" action="<?php echo base_url();?>/usuario/insertar" autocomplete="off">
            <?php csrf_field(); ?>

            <div class="form-group">
                <div class="row">
                    <div class="col-12 col-sm-6">
                        <label>Usuario</label>
                        <input class="form-control" id="usuario" name="usuario" type="text"
                        autofocus required />
                    </div>
                    <div class="col-12 col-sm-6">
                        <label>Nombre corto</label>
                        <input class="form-control" id="nombre_corto" name="nombre_corto"
                         type="text" require/>
                    </div>
                </div>
                </div>
                <br>
                <a href="<?php echo base_url(); ?>/unidades" class="btn btn-primary">Regresar</a>
                <button type="submit" class="btn btn-success">Guardar</button>
           

            </form>
                       
               
         </div>
    </main>

 