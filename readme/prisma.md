## Prisma

Install Prisma : 

```bash
    npm i prisma --save-dev
        #installs prisma in package.json
        
    npm install prisma @types/pg --save-dev
    npm install @prisma/client @prisma/adapter-pg pg dotenv
        #Install required dependencies
        
    
    npx prisma init  --datasource-provider postgresql --output ../generated/prisma 
        # creates prisma folder in root
        # creates a prisma.config.ts in root
        # updated env variable in .env
            # DATABASE_URL="postgresql://username:password@localhost:5432/dbname?schema=schema_name"
    
    npx prisma migrate dev --name init  # Creates/updates database tables and runs migration
    
    npx prisma generate                 # Generates Prisma Client for use in your code
    
    npx prisma studio                   # open db in localhost:5555

    npx prisma migrate reset            # reset your db

    npx prisma db pull                  # sync with schema of the current db

    npx prisma db seed                  # run seed file prisma/seed.ts
            
``` 
