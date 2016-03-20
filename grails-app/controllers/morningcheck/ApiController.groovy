package morningcheck

class ApiController {

    def index() {
        def space = Space.findAll()

        respond space , [formats:[ 'json']]
    }

    def activespaces(){
        def query = Space.where {
            ( expire_date > new Date() )
        }

        def spaces = query.list()

        respond spaces, [formats:[ 'json']]
    }


    def freespace(){


         String [][] matrix = new String[60][124]

        for (int row=0;row < 60; row++){
            for(int col=0; col <  124 ;col++){
                matrix[row][col]="1-"+row+"-"+col;
            }
        }

        def spaces = Space.findAll()

        for (space in spaces){

            def x =space.pos_x
            def y= space.pos_y


            for(int row=x;row < space.size_x/10;row++){
                for(int col=y;col < space.size_y/10;col++){
                    matrix[row][col]="0-"+row+"-"+col;
                }
            }
        }

        respond matrix, [formats:[ 'json']]

    }
}
